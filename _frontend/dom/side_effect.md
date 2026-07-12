# Side Effect 

组件的渲染是纯函数，不能有任何副作用 （比如**请求接口**、DOM操作、设置定时器）。

要怎么处理会产生 Side Effect 类的函数呢? 

- 原生 JavaScript 操作 DOM 可以使用 `getElementById` （但要注意运行的时机）
- Vue -> `ref` 或者 `reactive`
- React -> `useEffect` (React 官方定义是处理副作用的方式)。

## 一、原生 JavaScript 操作 DOM (传统方式)

Try to run the following: 

```html 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JavaScript Before DOM created</title>
    <script>
        document.getElementById('content').innerHTML = '<h1>Hello, World!</h1>';
    </script>
</head>
<body>
    <div id="content"></div>
</body>
</html>
```

You may get error `Uncaught TypeError: Cannot set properties of null (setting 'innerHTML')`

The JavaScript code was executed before the DOM was created. 

在没有框架的情况下，有 3 种主流做法：

- DOMContentLoaded事件 （推荐）
- 把 `<script>` 放到 `</body>` 之前
- `window.onload` （不推荐）
- `defer` 和 `async`
  - `defer`: 适用于外部脚本。添加 defer 后，脚本会异步下载，但‌延迟到 HTML 解析完成后按顺序执行‌。这是将脚本放在 `<head>` 中的最佳选择，既保证了变量提前可用，又不阻塞渲染 。
  - `async`: 适用于无依赖的独立脚本（如统计代码）。脚本异步下载并‌一旦完成立即执行‌，不保证执行顺序，也不等待 DOM 就绪 。

这是一个非常经典且核心的前端问题。简单来说，核心原则是：让 JavaScript 代码的执行时机，晚于浏览器解析并构建 DOM 树的时间。

这是一个非常经典的前端基础问题，但在 Next.js / React​ 语境下，答案和传统 HTML + JS 略有不同。我们可以按 “原生 JS” → “React / Next.js”​ 两个层面来理解，你目前最需要掌握的是后者。
‌‌

### DOMContentLoaded事件

在 DOM 解析完成后插入一个触发事件。

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JavaScript Before DOM created</title>
    <script>
        addEventListener('DOMContentLoaded', () => document.getElementById('content').innerHTML = '<h1>Hello, World!</h1>');
    </script>
</head>
<body>
    <div id="content"></div>
</body>
</html>
```

### 把 `<script>` 放到 `</body>` 之前

原理是DOM解析是按顺序的。

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JavaScript Before DOM created</title>
</head>
<body>
    <div id="content"></div>
    <script>
        document.getElementById('content').innerHTML = '<h1>Hello, World!</h1>';
    </script>
</body>
</html>
```

###  `window.onload` (不推荐)

待所有静态资源载入后 (例如图片、样式等) 再执行。
由于网络可能不稳定，所以这个行为实际上也是不可知的。

📌 缺点：​ 太慢，通常不推荐只为了操作 DOM 而用它。

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JavaScript Before DOM created</title>
    <script>
        window.onload = () => {
            document.getElementById('content').innerHTML = '<h1>Hello, World!</h1>';
        }
    </script>
</head>
<body>
    <div id="content"></div>
</body>
</html>
```
---


## 二、Vue 中操作 DOM 

在 Vue 中，**原则上我们不推荐直接操作 DOM**（这是 Vue 和 React 共同的理念）。Vue 的核心是 **数据驱动 DOM**：你只需要关心数据（State）怎么变，Vue 会自动帮你更新 DOM。

但是，**总有一些特殊情况必须碰 DOM**，比如：
1.  集成第三方库（如 Echarts、地图 SDK、音频波形图）。
2.  精确控制焦点（Focus）、文本选区（Selection）。
3.  获取 DOM 的尺寸或位置（用于计算动画，比如你的抖音滑动挑战）。
4.  调用原生的 DOM API（如 `scrollIntoView`）。

针对这些情况，Vue 提供了**标准且安全**的操作方式。

> React 和 Vue 都在说：“别碰 DOM，让我来！” 如果你非要碰，Vue 递给你一把叫 `ref` 的安全钥匙，而不是让你直接翻窗户（`document.querySelector`）。


### 一、 首选方案：`ref`（模版引用）

这是 Vue 官方推荐的“合法”操作 DOM 的方式。你可以把它理解为给 DOM 元素起了一个名字，然后通过这个名字拿到它的引用。

#### 1. 基本用法

**Step 1: 在模板中标记 `ref`**
```vue
<template>
  <!-- 给 div 起个名字叫 "wordBox" -->
  <div ref="wordBox" class="p-4 bg-blue-100">
    {{ currentWord }}
  </div>
  <button @click="changeColor">改变背景色</button>
</template>
```

**Step 2: 在 `<script setup>` 中定义同名变量**
Vue 会自动把名为 `wordBox` 的 DOM 元素赋值给这个变量。

```vue
<script setup lang="ts">
import { ref, onMounted } from 'vue'

// 定义一个 ref，名字必须和模板里的 ref="wordBox" 一致
const wordBox = ref<HTMLElement | null>(null)

// 定义一个方法
const changeColor = () => {
  // 注意：.value 才是 DOM 对象
  if (wordBox.value) {
    wordBox.value.style.backgroundColor = 'red'
  }
}
</script>
```

#### 2. 关键注意事项：时机很重要！

**你不能在组件刚加载时就去访问 DOM。**
在 `setup()` 或 `<script setup>` 执行的瞬间，DOM 还没被渲染出来。

✅ **正确的时机：在 `onMounted` 钩子中访问**
```vue
<script setup lang="ts">
import { ref, onMounted } from 'vue'

const wordBox = ref<HTMLElement | null>(null)

onMounted(() => {
  // 此时 DOM 已经挂载完毕，可以安全操作
  console.log(wordBox.value?.offsetWidth)
})
</script>
```

✅ **如果 DOM 依赖于数据变化（如 v-if）：使用 `nextTick`**
当你修改了响应式数据，DOM 不会立即更新，Vue 会在下一次“tick”中批量更新。如果你需要在数据变化后立即拿到最新的 DOM，需要用 `nextTick`。

```vue
<template>
  <div ref="content" v-if="show">新内容</div>
</template>

<script setup lang="ts">
import { ref, nextTick } from 'vue'

const show = ref(false)
const content = ref<HTMLElement | null>(null)

const toggle = async () => {
  show.value = true
  // 此时 DOM 还没更新，content.value 还是 null
  
  await nextTick() // 等待 DOM 更新完毕
  
  // 现在可以拿到 DOM 了
  console.log(content.value?.innerText)
}
</script>
```

---

### 二、 针对你的英语学习 App 的实际应用场景

#### 场景 1：抖音式挑战模式（滑动动画）
虽然我们用 `@vueuse/motion` 做动画，但如果要计算卡片高度来定位：
```vue
<template>
  <div ref="cardContainer" class="h-screen">
    <div v-for="word in words" :key="word.id" class="card">
      {{ word.text }}
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'

const cardContainer = ref<HTMLElement | null>(null)

onMounted(() => {
  // 计算单个卡片的高度，用于滑动距离的计算
  if (cardContainer.value) {
    const cardHeight = cardContainer.value.clientHeight
    console.log('Card height:', cardHeight)
    // 滑动到下一张 = translateY(-cardHeight)
  }
})
</script>
```

#### 场景 2：听写/跟读（自动 Focus 输入框）
用户点击“开始听写”后，自动聚焦到输入框，提升体验。
```vue
<template>
  <input ref="answerInput" type="text" placeholder="输入听到的单词" />
  <button @click="focusInput">开始听写</button>
</template>

<script setup lang="ts">
import { ref } from 'vue'

const answerInput = ref<HTMLInputElement | null>(null)

const focusInput = () => {
  // 调用原生 DOM 方法
  answerInput.value?.focus()
  // 还可以选中所有文字
  answerInput.value?.select()
}
</script>
```

#### 场景 3：集成音频波形图（第三方库）
假设你要用 `wavesurfer.js` 显示跟读的波形。
```vue
<template>
  <div ref="waveform"></div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import WaveSurfer from 'wavesurfer.js'

const waveform = ref<HTMLElement | null>(null)

onMounted(() => {
  if (waveform.value) {
    // 把 DOM 节点传给第三方库
    WaveSurfer.create({
      container: waveform.value,
      waveColor: 'red',
      progressColor: 'purple'
    })
  }
})
</script>
```

---

### 三、 千万别这么做（Vue 禁忌）

❌ **不要用 `document.querySelector`**
虽然它能工作，但这破坏了 Vue 的封装和虚拟 DOM 机制，容易导致不可预测的 bug（尤其是在列表渲染或组件复用的情况下）。
```javascript
// ❌ 错误示范
const el = document.getElementById('my-word')
el.style.color = 'red'

// ✅ 正确做法
const el = ref(null)
el.value.style.color = 'red'
```

❌ **不要在模板中用 `ref` 绑定后，又在 JS 里随意替换它**
Vue 管理着 `ref`，你只需要读取它，不要直接给它赋值为新的 DOM 对象。

---

### 四、 特殊指令：`v-` 指令（Vue 的魔法）

很多时候你以为需要 JS 操作 DOM，其实用 Vue 的指令就能优雅解决：

1.  **显示/隐藏 (`v-if` / `v-show`)**
    *   不需要 `el.style.display = 'none'`。
2.  **动态样式 (`v-bind:class` / `v-bind:style`)**
    *   不需要 `el.classList.add('active')`。
    *   **推荐做法**：用数据驱动 Class。
    ```vue
    <template>
      <div :class="{ 'bg-red-500': isWrong, 'bg-green-500': isCorrect }">
        单词
      </div>
    </template>
    <script setup>
    const isWrong = ref(false)
    const isCorrect = ref(true)
    </script>
    ```
3.  **生命周期钩子 (`onMounted`, `onUpdated`)**
    *   不需要监听 DOMContentLoaded 事件。

---

### 五、 总结：Vue 操作 DOM 的心法

1.  **先想数据**：能不能通过改变 `ref` 或 `reactive` 的数据来实现效果？如果能，坚决不改 DOM。
2.  **必须操作**：使用 `ref` 属性标记 DOM。
3.  **时机正确**：在 `onMounted` 或 `nextTick` 中访问 `xxx.value`。
4.  **类型安全**：记得给 `ref` 标注类型（如 `ref<HTMLElement | null>(null)`），TS 会帮你检查错误。

**一句话记忆：**
> React 和 Vue 都在说：“别碰 DOM，让我来！” 如果你非要碰，Vue 递给你一把叫 `ref` 的安全钥匙，而不是让你直接翻窗户（`document.querySelector`）。

需要我帮你把之前那个 **抖音滑动组件** 用 Vue 3 + `ref` + `@vueuse/motion` 完整实现一遍吗？这能很好地帮你理解 DOM 操作和动画的结合。
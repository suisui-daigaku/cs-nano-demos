import React from "react";

// 注意其实应该单独命令一个 Hello.js 的 Component 
const Hello = (props) => {
  return (
    <div>
      <p>
        Hello {props.name}, you are {props.age} years old
      </p>
    </div>
  )
}

export default Hello;

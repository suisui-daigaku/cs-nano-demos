import React from "react";
import Hello from "./Hello"; 

const App = () => {
  const name = 'Maaya Uchida'
  const birthDate = new Date('1989-12-27');
  const now = new Date(); 
  const age = today.getFullYear() - birthDate.getFullYear(); 
  const monthDiff = now.getMonth() - birthDate.getMonth(); 
  if (monthDiff < 0 || (monthDiff == 0 && now.getDate() < birthDate.getDate())){
	age--; 
  }
  
  return (
    <div>
      <h1>Greetings</h1>
      <Hello name={name} age={age} />
    </div>
  )
}

// 这个文件 "App.js" 对外的默认 Component 
export default App;

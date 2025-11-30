/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
// Login Form 1 - Glassmorphism Style JavaScript
// This file extends form-utils.js with form-specific functionality

function handleSubmit(e){
      e.preventDefault();
      // aquí iría la lógica real (fetch/validation). Por ahora solo efecto visual
      const btn = document.querySelector('.btn');
      btn.disabled = true;
      btn.textContent = 'LOADING...';
      setTimeout(()=>{
        btn.disabled = false;
        btn.textContent = 'LOGIN';
        alert('Simulación de login — reemplaza por tu lógica.');
      },900);
      return false;
    }

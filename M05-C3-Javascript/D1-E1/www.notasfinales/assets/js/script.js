// IDENTIFICACION

var nombre = document.getElementById("nombre");
var carrera = document.getElementById("carrera");

nombre.innerHTML = prompt("Ingrese su nombre Completo");
carrera.innerHTML = prompt("Ingrese su carrera");

// HTML

var r11 = document.getElementById("r11");
var r12 = document.getElementById("r12");
var r13 = document.getElementById("r13");
var r1a = document.getElementById("r1a")


var n11= +prompt("Nota 1 del ramo HTML");
var n12 = +prompt("Nota 2 del ramo HTML");
var n13 = +prompt("Nota 3 del ramo HTML");
var n1a = (n11 + n12 + n13) / 3;

r11.innerHTML = n11;
r12.innerHTML = n12;
r13.innerHTML = n13;
r1a.innerHTML = (n1a).toFixed(1);



// CSS

var r21 = document.getElementById("r21");
var r22 = document.getElementById("r22");
var r23 = document.getElementById("r23");
var r2a = document.getElementById("r2a")


var n21= +prompt("Nota 1 del ramo CSS");
var n22 = +prompt("Nota 2 del ramo CSS");
var n23 = +prompt("Nota 3 del ramo CSS");
var n2a = (n21 + n22 + n23) / 3;

r21.innerHTML = n21;
r22.innerHTML = n22;
r23.innerHTML = n23;
r2a.innerHTML = (n2a).toFixed(1);

// JavaScript

var r31 = document.getElementById("r31");
var r32 = document.getElementById("r32");
var r33 = document.getElementById("r33");
var r3a = document.getElementById("r3a")


var n31= +prompt("Nota 1 del ramo JavaScript");
var n32 = +prompt("Nota 2 del ramo JavaScript");
var n33 = +prompt("Nota 3 del ramo JavaScript");
var n3a = (n31 + n32 + n33) / 3;

r31.innerHTML = n31;
r32.innerHTML = n32;
r33.innerHTML = n33;
r3a.innerHTML = (n3a).toFixed(1);

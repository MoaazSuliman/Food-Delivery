let menu = document.querySelector('.links i')
let klassy = Array.from(document.querySelectorAll('.klassy .container .box'))
let filterbox = Array.from(document.querySelectorAll('.klassy .filterbox .box .boxp'))
menu.onclick = ()=>{
document.querySelector("ul").classList.toggle("active")
}


filterbox.forEach((box)=>{
box.addEventListener('click',addactive)
box.addEventListener('click',filter)
})
function addactive(){
    filterbox.forEach((e)=>{
e.classList.remove('active')
this.classList.add('active')
    })
}
function filter(){
   klassy.forEach((e)=>{
    // e.style.display = 'none'
    if(e.classList.contains(this.dataset.food)){
        e.style.display = 'flex'
    }
    else{
       e.style.display = 'none'
    }
 
   })

 
   
}
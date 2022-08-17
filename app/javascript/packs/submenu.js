document.addEventListener('turbolinks:load', () => {
    console.log('Hello World!');

    document.getElementById("dropdown__btn").onclick = function(){
        const btn = document.getElementById("dropdown__body");
        if(btn.style.display=="block"){
          btn.style.display = "none";
        }else{
          btn.style.display = "block";
        };
      };
  })
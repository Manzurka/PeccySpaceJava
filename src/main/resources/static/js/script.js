
$(document).ready(function(){
    $.get('/posts', function(all_posts){
        for(var i=0; i < all_posts.length; i++){
        	
             var html_str= `
            	  <div class="post" id="${all_posts[i].id}">
	                <h2>${all_posts[i].title}</h2>
	                <form action="/post/${all_posts[i].id}/update" method="post">
	                   <p>${all_posts[i].post}<button id="edit">Edit</button></p>
	                 
	                </form>
	              </div>`;
             $('#all_posts').append(html_str);
         }
        console.log(all_posts.length);
        console.log("hello");
     }, 'json')
//        
//      $('form').submit(function(){
//         
//         $.post('/add', $(this).serialize(), function(p){
//             var html_str= `
//              <div class="post" id="${p.id}">
//	               <h2>${p.title}</h2>
//	               <form action="/post/${p.id}/update" method="post">
//	                   <p>${post.post}<button id="edit">Edit</button></p>
//	                   <p class="italic">posted by ${p.author.getName()}</p>
//	               </form>
//	              </div>
//               `;
//           $('#all_posts').append(html_str);
//           
//         }, 'json')
//         
//          return false;
//     })
     
 });
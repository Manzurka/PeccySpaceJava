 
	$.get('/posts', function(all_posts){
    	console.log(all_posts);
        for(var i=0; i < all_posts.length; i++){
             var html_str= `
               <div class="post" id="${all_posts[i].id}">
                   <h3>${all_posts[i].title}</h3>
                   <p>${all_posts[i].post}</p>
                   <form type="hidden"  class="update" action="/post/${all_posts[i].id}/update" method="post">
                   </form>
                   <button id="edit">Edit</button>
                   <form type="hidden" class="delete" action="/post/${all_posts[i].id}/delete" method="post">
                   	<button id="delete">Delete</button>
                   </form>
               </div>
               `;
             $('#all_posts').append(html_str);
        }

    
    $('.post').on("click", "#edit", function(post){
     	   var desc = $(this).siblings()[1].innerHTML;
     	   $(this).parent().find('p').remove();    
     
            var html_str =` 
                <textarea name="post">`+desc+`</textarea>
                <button id="update">Update</button>
            `;
            $(this).parent().find('form:first').append(html_str);
            $(this).remove(); 
     })
     

    }, 'json')


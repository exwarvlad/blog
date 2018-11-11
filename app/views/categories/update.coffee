$('#exampleModal').modal('toggle')
$('#' + <%= @category.id %>).replaceWith('<%= render partial: 'category', collection: [@category] %>')
$('.notice').html('<%=j render 'layouts/messages' %>')
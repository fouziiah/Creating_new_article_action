$(function(){
    // alert('jquery is working');
    // form validation for comment body
    $('#comment-body').on('input', function(){
        console.log('input event fired')
        const value = $(this).val().trim();
        const submitButton = $(this).closest('form').find('input[type="submit"]');

        if (value === ''){
            console.log(value);
            $(this).css('border-color', 'red');
            submitButton.prop('disabled', true);

        }else {
            $(this).css('border-color', '');
            submitButton.prop('disabled', false);
        }
        });

        $('#load-comments').on('click', function (){
            const categoryId = $('#category-id').data('category');
            const articleId = $('#load-comments').data('article');
            // console.log(articleId)
            // console.log(categoryId)

            const url = `/categories/${categoryId}/articles/${articleId}/comments`;

        
            $.getJSON(url, function(data) {
                console.log(data);
            
                data.forEach(function(comment) {
                    $('#comments').append('<div>' + comment.body + '</div>');
                });
            });
            
        });
    
});
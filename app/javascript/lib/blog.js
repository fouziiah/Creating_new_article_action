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
            const url = '/categories/1/articles/4/comments';
            console.log($.getJSON(url));
            $.getJSON(url, function(data){
                console.log(data);
            })
        });
    
});
var root = location.protocol + '//' + location.host;
var add_to_cart_url = root + '/component/function/add_to_cart.php';
var update_cart_item_count_url = root + '/component/function/update_cart_item_count.php';

$(document).ready(function() {
    $('.product-card-container').click(function() {
        $(this).children('form').submit();
    });

    var btn_animation_flag = {};
    $('.add-to-cart').click(function(event) {
        event.stopPropagation();
        var product_id = $(this).data('id');
        console.log(btn_animation_flag);
        if (!(product_id in btn_animation_flag)) {
            btn_animation_flag[product_id] = false;
        }

        $.ajax({
            url: add_to_cart_url,
            type: 'POST',
            data: {
                product_id: product_id
            },
            success: function(response) {
                if (response == 'not logged-in') {
                    alert('Please log in to start shopping');
                }
                else if (response == 'success') {
                    $.ajax({
                        url: update_cart_item_count_url,
                        success: function(response) {
                            document.getElementById('cart-item-count-text').innerHTML = response;
                        }
                    });
                    console.log('before' + btn_animation_flag[product_id]);
                    if (!btn_animation_flag[product_id]) {
                        btn_animation_flag[product_id] = true;
                        console.log('start' + btn_animation_flag[product_id]);
                        $('#add-message-' + product_id)
                        .animate(
                            { height: 'toggle', opacity: 'toggle' }, 
                            'slow',)
                        .delay(1000)
                        .animate(
                            { height: 'toggle', opacity: 'toggle' }, 
                            'fast', function() {
                                btn_animation_flag[product_id] = false;
                                console.log('finish' + btn_animation_flag[product_id]);
                            });
                    }
                }
                else if (response == 'out of stock') {
                    alert('Out-of-stock');
                }
                else if (response == 'exceeds current stock') {
                    alert('Amount to add exceeds current stock!');
                }
            }
        });
    });
});
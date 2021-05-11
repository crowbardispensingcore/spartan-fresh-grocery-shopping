var root = location.protocol + '//' + location.host;
var modify_cart_url = root + '/shopping_cart/src/modify_cart.php';
var update_username_url = root + '/component/function/update_username.php';
var check_stock_url = root + '/component/function/get_cart_item_stock.php';

$(document).ready(function() {
    updateEmptyCartMsg();
    $('.remove').click(function() {
        var item = this;
        var idToRemove = $(item).data('id');

        var confirmMsg = confirm("Remove item?");
        if (confirmMsg) {
            $.ajax({
                url: modify_cart_url,
                type: 'POST',
                data: { 
                    action: 'remove',
                    id: idToRemove
                },
                success: function(response) {
                    if (response == 1) {
                        var imgId = '#img-' + idToRemove;
                        var rowId = '#item-row-' + idToRemove;
                        $(imgId).find('img')
                            .css({'transform': 'scale(0)'})
                            .promise().done(function() {
                                $(rowId).slideUp("slow", function() {
                                    updateEmptyCartMsg();
                                });
                        });
                        updateSubtotal();
                        updateCartItemCount();
                    }
                    else {
                        alert('Failed to remove item!');
                    }
                }
            });
        }
    });

    $('.decrement').click(function() {
        var idToDecrement = $(this).data('id');
        var textId = 'quantity-text-' + idToDecrement;
        var newVal = Number(document.getElementById(textId).innerHTML) - 1;
        if (newVal < 1) {
            return;
        }
        
        $.ajax({
            url: modify_cart_url,
            type: 'POST',
            data: { 
                action: 'decrement',
                id: idToDecrement,
                newVal: newVal
            },
            success: function(response) {
                if (response == 1) {
                    document.getElementById(textId).innerHTML = newVal;
                    updateItemTotal(idToDecrement);
                    updateSubtotal();
                    updateCartItemCount();
                }
                else {
                    alert('Failed to decrement!');
                }
            }
        });
    });

    $('.increment').click(function() {
        var idToIncrement = $(this).data('id');
        var textId = 'quantity-text-' + idToIncrement;
        var newVal = Number(document.getElementById(textId).innerHTML) + 1;

        if (newVal > 99) {
            return;
        }

        var exceed_stock = false;
        $.ajax({
            url: check_stock_url,
            type: 'POST',
            data: {
                item_id: idToIncrement
            },
            success: function(response) {
                if (newVal > response) {
                    alert('Amount in cart exceeds current stock!');
                    return;
                }

                $.ajax({
                    url: modify_cart_url,
                    type: 'POST',
                    data: { 
                        action: 'increment',
                        id: idToIncrement,
                        newVal: newVal
                    },
                    success: function(response) {
                        if (response == 1) {
                            document.getElementById(textId).innerHTML = newVal;
                            updateItemTotal(idToIncrement);
                            updateSubtotal();
                            updateCartItemCount();
                        }
                        else {
                            alert('Failed to increment!');
                        }
                    }
                });
            }
        });     
    });
});

function updateItemTotal(id) {
    var quantity = Number(document.getElementById('quantity-text-' + id).innerHTML);
    var price = 
        Number((document.getElementById('item-price-text-' + id).innerHTML).substring(1));
    var newTotal = quantity * price;
    document.getElementById('item-total-text-' + id).innerHTML = '$' + newTotal.toFixed(2);
}

// Get current subtotal
function updateSubtotal() {
    $.ajax({
        url: modify_cart_url,
        type: 'POST',
        data: { 
            action: 'getSubtotal',
            id: '0'
        },
        success: function(response) {
            document.getElementById('subtotal-text').innerHTML = 'Subtotal: $' + response;
        }
    });
}

// Update current cart item count
function updateCartItemCount() {
    $.ajax({
        url: '../src/modify_cart.php',
        type: 'POST',
        data: { 
            action: 'getCartItemCount',
            id: '0'
        },
        success: function(response) {
            document.getElementById('cart-item-count-text').innerHTML = response;
            if (response == 0 || response == 1) {
                document.getElementById('summary-item-count-text').innerHTML = response + ' item';
            }
            else {
                document.getElementById('summary-item-count-text').innerHTML = response + ' items';
            }
        }
    });
}

// Show or hide empty cart msg
function updateEmptyCartMsg() {
    $.ajax({
        url: modify_cart_url,
        type: 'POST',
        data: { 
            action: 'getCartItemCount',
            id: '0'
        },
        success: function(response) {
            if (response == 0) {
                document.getElementById('empty-msg-row').style.display = 'flex';
                document.getElementById('check-out-btn').disabled = true;
            }
            else {
                document.getElementById('empty-msg-row').style.display = 'none';
                document.getElementById('check-out-btn').disabled = false;
            }
        }
    });
}
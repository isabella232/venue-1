const stripeTokenHandler = (token) => {
    // Insert the token ID into the form so it gets submitted to the server
    var form = document.getElementById('payment-form');
    var hiddenInput = document.createElement('input');
    hiddenInput.setAttribute('type', 'hidden');
    hiddenInput.setAttribute('name', 'stripeToken');
    hiddenInput.setAttribute('value', token.id);
    form.appendChild(hiddenInput);

    // Submit the form
    form.submit();
}

// Create a token or display an error when the form is submitted.
const activateForm = (stripe, card) => {
    var form = document.getElementById('payment-form');
    if (form) {
        form.addEventListener('submit', function (event) {
            event.preventDefault();
            stripe.createToken(card).then(function (result) {
                if (result.error) {
                    // Inform the customer that there was an error.
                    showToast('Error', result.error.message, { target: '#card-errors' });
                } else {
                    // Send the token to your server.
                    stripeTokenHandler(result.token);
                }
            });
        });
    }
}



const initiateStripe = (pkKey) => {
    var stripe = Stripe(pkKey);
    var elements = stripe.elements();

    // Custom styling can be passed to options when creating an Element.
    var style = {
        base: {
            color: '#fff',
            lineHeight: '18px',
            fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
            fontSmoothing: 'antialiased',
            fontSize: '16px',
            '::placeholder': {
                color: '#fff'
            }
        },
        invalid: {
            color: '#fa755a',
            iconColor: '#fa755a'
        }
    };
    // Create an instance of the card Element.
    var card = elements.create('card', { style: style, hidePostalCode: true });

    // Add an instance of the card Element into the `card-element` <div>.
    card.mount('#card-element');
    card.addEventListener('change', function (event) {
        if (event.error) {
            showToast('Error', event.error.message, { target: '#card-errors' });
        } else {
            var toast = document.querySelector('.iziToast'); // Selector of your toast
            if (toast) {
                iziToast.hide({}, toast);
            }
        }
    });

    // Activate the form actions
    activateForm(stripe, card);

}









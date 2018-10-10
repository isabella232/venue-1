const stripeTokenHandler = (token) => {
    var form = document.getElementById('payment-form');
    var hiddenInput = document.createElement('input');
    hiddenInput.setAttribute('type', 'hidden');
    hiddenInput.setAttribute('name', 'stripeToken');
    hiddenInput.setAttribute('value', token.id);
    form.appendChild(hiddenInput);

    form.submit();
}

const activateForm = (stripe, card) => {
    var form = document.getElementById('payment-form');
    if (form) {
        form.addEventListener('submit', event => {
            event.preventDefault();
            stripe.createToken(card).then((result) => {
                if (result.error) {
                    var toast = document.querySelector('.iziToast');
                    if (toast) {
                        iziToast.hide({}, toast);
                        showToast('Error', result.error.message, { target: '#card-errors' });
                    }
                } else {
                    stripeTokenHandler(result.token);
                }
            });
        });
    }
}

const addEventListenersToStripeForm = () => {
    var inputs = document.querySelectorAll('.cell.example.example2 .input');
    Array.prototype.forEach.call(inputs, function (input) {
        input.addEventListener('focus', function () {
            input.classList.add('focused');
        });
        input.addEventListener('blur', function () {
            input.classList.remove('focused');
        });
        input.addEventListener('keyup', function () {
            if (input.value.length === 0) {
                input.classList.add('empty');
            } else {
                input.classList.remove('empty');
            }
        });
    });
}




const initiateStripe = (pkKey) => {
    var stripe = Stripe(pkKey);

    var elements = stripe.elements({
        fonts: [
            {
                cssSrc: 'https://fonts.googleapis.com/css?family=Source+Code+Pro',
            },
        ],
        // Stripe's examples are localized to specific languages, but if
        // you wish to have Elements automatically detect your user's locale,
        // use `locale: 'auto'` instead.
        locale: window.auto
    });

    // Floating labels
    var inputs = document.querySelectorAll('.cell.example.example2 .input');
    Array.prototype.forEach.call(inputs, function (input) {
        input.addEventListener('focus', function () {
            input.classList.add('focused');
        });
        input.addEventListener('blur', function () {
            input.classList.remove('focused');
        });
        input.addEventListener('keyup', function () {
            if (input.value.length === 0) {
                input.classList.add('empty');
            } else {
                input.classList.remove('empty');
            }
        });
    });

    var elementStyles = {
        base: {
            color: '#32325D',
            fontWeight: 500,
            fontFamily: 'Source Code Pro, Consolas, Menlo, monospace',
            fontSize: '16px',
            fontSmoothing: 'antialiased',

            '::placeholder': {
                color: '#CFD7DF',
            },
            ':-webkit-autofill': {
                color: '#e39f48',
            },
        },
        invalid: {
            color: '#E25950',

            '::placeholder': {
                color: '#FFCCA5',
            },
        },
    };

    var elementClasses = {
        focus: 'focused',
        empty: 'empty',
        invalid: 'invalid',
    };

    var cardNumber = elements.create('cardNumber', {
        style: elementStyles,
        classes: elementClasses,
    });
    cardNumber.mount('#example2-card-number');

    var cardExpiry = elements.create('cardExpiry', {
        style: elementStyles,
        classes: elementClasses,
    });
    cardExpiry.mount('#example2-card-expiry');

    var cardCvc = elements.create('cardCvc', {
        style: elementStyles,
        classes: elementClasses,
    });
    cardCvc.mount('#example2-card-cvc');

    registerElements([cardNumber, cardExpiry, cardCvc], 'example2');

}
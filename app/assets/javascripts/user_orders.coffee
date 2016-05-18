jQuery ->
    Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
    payment.setupForm()

payment =
    setupForm: ->
        $('#order').submit ->
            $('input[type=submit]').attr('disabled',true)
            Stripe.card.createToken($('#order'), payment.hanldeStripeResponse)
            false

    hanldeStripeResponse: (status,response) ->
        if status == 200
            $('#order').append($('<input type="hidden" name="stripeToken" />').val(response.id))
            $('#order')[0].submit()
        else
            $('#stripe_error').text(response.error.message).show()
            $('#order input[type=submit]').attr('disabled',false)

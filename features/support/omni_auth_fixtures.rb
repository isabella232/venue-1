module OmniAuthFixtures
    def self.facebook_mock
        {provider: 'facebook',
        uid: 10205522242159630,
        info:
            {email: 'thomas@craftacademy.se',
                name: 'Thomas Ochman',
                image: 'http://graph.facebook.com/v2.6/10205522242159630/picture'},
        credentials:
            {token: 'EAAXC253O740BANfJYLjz2LCzT1UcfuEsoHpZBMAifdiud8sulF2LIfjDy5BeGiNPEPQjUn7xpvAu0neqnGeoCAvCU2KIucyP5sYNQDaDtCj06UmOF2POEq8ZAajS2zaQ4B7uIIRgv4p3wlACmh9f9MsMnDZB6gZD',
                expires_at: 1517839337,
                expires: true},
            extra:
                {raw_info:
                    {name: 'Thomas Ochman', email: 'thomas@craftacademy.se', id: '10205522242159630'}}}
    end

    def self.facebook_response_without_email
        {provider: 'facebook',
            uid: 10205522242159630,
            info:
                {name: 'Thomas Ochman',
                image: 'http://graph.facebook.com/v2.6/10205522242159630/picture'},
            credentials:
                {token:
                    'EAAXC253O740BANfJYLjz2LCzT1UcfuEsoHpZBMAifdiud8sulF2LIfjDy5BeGiNPEPQjUn7xpvAu0neqnGeoCAvCU2KIucyP5sYNQDaDtCj06UmOF2POEq8ZAajS2zaQ4B7uIIRgv4p3wlACmh9f9MsMnDZB6gZD',
                expires_at: 1517839337,
                expires: true},
            extra:
                {raw_info:
                    {name: 'Thomas Ochman', id: '10205522242159630'}}}
    end

    def self.google_oauth2_response
        {
        provider: 'google_oauth2',
        uid: '123456789101112130122',
        info: {
            email: 'joe@bloggs.com',
            first_name: 'Joe',
            image: "https://robohash.org/sitsequiquia.png?size=512x512",
            last_name: "Bloggs",
            name: "Joe Bloggs",
            urls: { Google: "https://plus.google.com/494850544950524948535348525457565050575557" }
        },
        credentials: {
            expires: true,
            expires_at: 1450062184,
            refresh_token: "XYZW...",
            token: "ABCDEF..."
        },
        extra: {
            id_info: {
            at_hash: 'abcdefg',
            aud: "50906091245.apps.googleusercontent.com",
            azp: "50906091245.apps.googleusercontent.com",
            email: "joe@bloggs.com",
            email_verified: true,
            exp: 1450062184,
            iat: 1450058584,
            iss: "accounts.google.com",
            sub: "102612410550469822979"
            },
            id_token: "abcdefghijklmnopqrstuvwxyz",
            raw_info: {
            email: "joe@bloggs.com",
            email_verified: "true",
            family_name: "Bloggs",
            gender: "male",
            given_name: "Joe",
            kind: "plus#personOpenIdConnect",
            locale: "en",
            name: "Joe Bloggs",
            picture: "https://robohash.org/sitsequiquia.png?size=512x512",
            profile: "https://plus.google.com/494850544950524948535348525457565050575557",
            sub: "494850544950524948535348525457565050575557"
            },
        }
        }
    end
end


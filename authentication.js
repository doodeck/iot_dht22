// authentication.js

const auth = require('./credentials.js')

module.exports = function (req, res, next) {
    // console.log(req)

    const found = auth.ids.find(id => id === req.query.id)
    if (typeof found !== 'undefined' && found.length > 0) {
        next()
    } else {
        console.error('Unauthorized id:', req.id)
        res.sendStatus(401)
    }
}

// module.exports = authenticate;

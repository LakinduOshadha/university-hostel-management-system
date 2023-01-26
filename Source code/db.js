const dotenv = require("dotenv")
dotenv.config()
const mysql = require("mysql")

// Connecting to SQL database
let dbConfig = {
    host: process.env.HOST,
    user: process.env.USER,
    password: process.env.PASSWORD,
    database: process.env.DATABASE,
    connectTimeout : 60000
}

console.log('Trying to connect to the database')
let db = mysql.createPool(dbConfig)
db.query('SELECT 1 + 1 AS solution', function (error, results, fields) {
    if (error) throw error
    const app = require('./app')
    app.listen(process.env.PORT)
    console.log('MySQL Connected')
    console.log('The solution is: ', results[0].solution) 
})
module.exports = db
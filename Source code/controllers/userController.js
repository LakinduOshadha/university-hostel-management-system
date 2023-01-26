const adminController = require("./adminController")
const Admin = require("../models/Admin")
let User = require("../models/User")
// import {login} from "./adminController"

exports.loginPage = function (req, res) {
    res.render("login")
}
exports.signupPage = function (req, res) {
    res.render("sign-up")
}
exports.home = function (req, res) {
    res.render("login")
}



exports.register = function (req, res) {

    let user = new User(req.body)
    user.register(function(results) {
        if (results == "Success") {
            res.render("dashboard")
        } else {
            res.send(results)
        }
    })
    
}

exports.login = function (req, res) {
    let user = new User(req.body)
    let admin = new Admin(req.body)

    user.login(function(results) {
        if (results == 'success') {
            res.render("dashboard")
        } else    
        {
            admin.login(function(results) {
                if (results.loginStatus == 'success') { 
                       
                    res.render("admin")
                    module.exports = results.currentLogin
                } else {
                    res.send(results)
                }
            }) 
        }
    })
    
}

exports.logout = function (req, res) {
    // req.session.destroy()
    // res.send("Loggedout Successfully")
    res.render("login")

}




const db = require('../db')
const validator = require("validator")
const { colours } = require('nodemon/lib/config/defaults')

let User = function (data) {
    this.data = data
    this.errors = []
}

User.prototype.validateRegNo = function(callback) {
    if (this.data.regNo.length > 11) {this.errors.push("You must provide a valid Registration Number."); return}
    if (!(this.data.regNo[4] == "E" ||
        this.data.regNo.substring(4,6) == "ET" ||
        this.data.regNo.substring(4,7) == "BST" ||
        this.data.regNo.substring(4,6) == "AG")) {
        this.errors.push("You must provide a valid Registration Number."); return
    }
    if (!validator.isAlphanumeric(this.data.regNo)) {this.errors.push("You must provide a valid Registration Number.")}
    // Checking database

    // Retrieving data from database
    let sql = `SELECT reg_no FROM students WHERE reg_no = ${this.data.regNo}`

    db.query(sql,(err, results) => {
        if (err) console.log("Error")

        // console.log(results)

        if(results.length) {
            this.errors.push("Provided Registration Number is already in use")
        }

        // console.log(this.errors)

        this.addData(callback)
        
    }) 

    // this.errors.push("Provided Registration Number is already in use")
    //console.log(results)

    // //if (results) {this.errors.push("Provided Registration Number is already in use")}
}

User.prototype.validateEmail = function() {
    if (!validator.isEmail(this.data.email)) {this.errors.push("You must provide a valid Email."); return}
    if (this.data.email.substring(this.data.email.length - 9,this.data.email.length) != "jfn.ac.lk") {
        this.errors.push("You must provide a valid Email."); return
    }
    // Checking database
    //if () {this.errors.push("Provided Email is already in use."); return}
}

User.prototype.validate = function() {
    if (this.data.name.length < 4) { this.errors.push("You must provide a" +
        " valid Name.")}
    if (!validator.isNumeric(this.data.phoneNo) || this.data.phoneNo.length != 10) { this.errors.push("You must" +
        " provide a valid Phone Number.")}
    this.validateEmail()
    if (!validator.isStrongPassword(this.data.password)) { this.errors.push("You must provide a Strong Password." +
        "Password should contain minLength: 8, minLowercase: 1, minUppercase: 1, minNumbers: 1, minSymbols: 1")}
}

User.prototype.cleanUp = function() {
    if (typeof(this.data.name) != "string"){this.data.name = ""}
    if (typeof(this.data.regNo) != "string"){this.data.regNo = ""}
    if (typeof(this.data.phoneNo) != "string"){this.data.phoneNo = ""}
    if (typeof(this.data.email) != "string"){this.data.email = ""}
    if (typeof(this.data.password) != "string"){this.data.password = ""}

    this.data = {
        name: this.data.name.trim().toUpperCase(),
        regNo: this.data.regNo.trim().toUpperCase(),
        faculty: this.data.faculty.toUpperCase(),
        year: this.data.year.toUpperCase(),
        gender: this.data.gender.toUpperCase(),
        email: this.data.email.trim().toLowerCase(),
        password: this.data.password,
        phoneNo: this.data.phoneNo.trim()
    }
}

User.prototype.addData = function(callback) {
            // console.log(this.errors)

    if (!this.errors.length) {
        // console.log(this.errors)

        let post = {
            student_name: this.data.name,
            reg_no: this.data.regNo,
            faculty: this.data.faculty,
            year: this.data.year,
            gender: this.data.gender,
            email: this.data.email,
            password: this.data.password,
            telephone_number: this.data.phoneNo,
        }

        let sql = 'INSERT INTO students SET ?'

        db.query(sql, post,(err, results) => {
          if (err) {
              this.errors.push("Please check your email again")
              callback(this.errors)
          }
          else callback("Success")
        })

        // let sql = `call student_insert(${this.data.name},${this.data.regNo},${this.data.faculty},
        //     ${this.data.year},${this.data.gender},${this.data.email},
        //     ${this.data.password},${this.data.phoneNo})`

        // db.query(sql, (err, results) => {
        //   if (err) throw err;
        // //   console.log('Success')
        // })

    } else {
      callback(this.errors)
    }
}

User.prototype.register = function(callback) {
    // Validate user data
    this.cleanUp()
    this.validate()
    this.validateRegNo(callback)

    // Only if there is no validation errors, then save data to database
   
    
}


User.prototype.login = function(callback) {

    // Retrieving data from database
    let sql = `SELECT email,password FROM students WHERE email = "${this.data.email}"`

    db.query(sql,(err, results) => {
        if (err) console.log("Error2")

        if (results.length) {
            if(results[0].password == this.data.password) {
                callback('success')
            } else callback('Wrong Username/Password.!')
            
        } else callback('Wrong Username/Password.!')
    })
}

module.exports = User
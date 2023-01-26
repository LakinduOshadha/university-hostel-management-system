const db = require('../db')
const { v4: uuidv4 } = require('uuid');


let Admin = function (data) {
    this.data = data
}

Admin.prototype.login = function(callback) {

    // Retrieving data from database
    let sql = `SELECT email,password,admin_id FROM admin WHERE email = "${this.data.email}"`

    db.query(sql,(err, results) => {
        if (err) console.log("Error")

        if (results.length) {
            if(results[0].password == this.data.password) {
                callback({
                    loginStatus: "success",
                    currentLogin: results[0].admin_id
                })
            } else callback('Wrong Username/Password.!')
            
        } else callback('Wrong Username/Password.!')
    })
}

Admin.prototype.itemDetails_serveRoom = function(callback) {
    //Retrieving data from database from items table
    // Inner join


    let sql = `SELECT items.item_id, items.name, items.conditionStatus, items.note
    FROM items 
    JOIN rooms
    ON rooms.room_id = items.room_id
    JOIN hostel
    ON hostel.hostel_id = rooms.hostel_id
    WHERE rooms.room_no = "${this.data.roomNumber}" AND hostel.name = "${this.data.hostelName}"
    AND items.conditionStatus <> "Missing"
    `
    db.query(sql,(err, results) => {
        if (err) console.log("Erro1111r")    
        else callback (results)
    })

}

Admin.prototype.getItemDetails = function(callback) {
    // console.log(this.data)

    
    let sql = `SELECT items.cost, items.name
    FROM items 
    WHERE items.item_id = "${this.data}"`

    db.query(sql,(err, results) => {
        if (err) console.log("Erro1111r")    
        else callback (results)
    })
}

Admin.prototype.updateRoomHistory_recieved = function(callback) {
 
    let sql = `UPDATE roomhistory 
    SET issued_or_recieved="recieved" 
    
    WHERE room_id = "${this.data}"
    
    `
    db.query(sql,(err, results) => {
      if (err) {console.log(err)}
      callback("Success")
    //   console.log(results)
    })

}

Admin.prototype.getRoomDetails = function(callback) {
    let sql = `SELECT hostel.name, rooms.room_no, students.reg_no, rooms.room_id, students.student_name,
    students.faculty, students.year, roomhistory.issued_date, roomhistory.received_date
    FROM hostel 
    JOIN rooms
    ON hostel.hostel_id = rooms.hostel_id
    JOIN roomhistory
    ON roomhistory.room_id = rooms.room_id
    JOIN students
    ON students.ID = roomhistory.student_id
    JOIN items
    ON items.room_id = rooms.room_id
    WHERE items.item_id = "${this.data}"
    AND roomhistory.issued_or_recieved = "issued"

    `
    db.query(sql,(err, results) => {
        if (err) console.log(err)    
        else callback (results)
    })
}

Admin.prototype.addStudentsButton = function(callback) {
    this.data.newStudent = this.data.newStudent.trim().toUpperCase();

    let post = {
        entry_id: this.data.uuid,
        student_id: this.data.student_id,
        room_id: this.data.room_id,
        admin_id: 2,
        issued_or_recieved: 'issued',
    }

    let sql = 'INSERT INTO roomhistory SET ?'
    db.query(sql, post,(err, results) => {
      if (err) {console.log(err)}
      else {
        callback("New Student Added") 
      }
    })

}

Admin.prototype.checkStudentHasRoomUpdate = function(callback) {
    let sql = `SELECT students.reg_no
    FROM students 
    JOIN roomhistory
    ON roomhistory.student_id = students.ID
    WHERE roomhistory.issued_or_recieved = "issued" AND students.reg_no = "${this.data.newStudent}"
    `

    db.query(sql,(err, results) => {
        if (err) {console.log(err)}
        else callback(results)
    })
}


Admin.prototype.roomServeConfirm = function(callback) {

    let callBackResponse = [];

    let uuidTemp;
    if (this.data.lastServedStudentUuid) {
        uuidTemp = this.data.lastServedStudentUuid
    } else {
        uuidTemp = uuidv4();
    }
    // console.log(this.data)
    


    // console.log(this.data)
    this.data.student01 = this.data.student01.trim().toUpperCase();
    this.data.student02 = this.data.student02.trim().toUpperCase();
    this.data.student03 = this.data.student03.trim().toUpperCase();
    this.data.student04 = this.data.student04.trim().toUpperCase();




    // Inner join
    let sql = `SELECT rooms.room_id
    FROM rooms 
    JOIN hostel
    ON rooms.hostel_id = hostel.hostel_id
    WHERE rooms.room_no = "${this.data.roomNumber}" AND hostel.name = "${this.data.hostelName}"
    `
    db.query(sql,(err, room_id) => {
        if (err) console.log("Error1")  
        
        // Retrieving data from database from students01
        if(this.data.student01){
        let sql = `SELECT ID FROM students WHERE reg_no = "${this.data.student01}"`
        db.query(sql,(err, student_id) => {
            if (err) console.log("Error2")

            
            if (student_id.length == 0) callBackResponse.push(`Student ${this.data.student01} is not registered yet`)
            else {
                let post = {
                    entry_id: uuidTemp,
                    student_id: student_id[0].ID,
                    room_id: room_id[0].room_id,
                    admin_id: 2,
                    issued_or_recieved: 'issued',
                }
        
                let sql = 'INSERT INTO roomhistory SET ?'
                db.query(sql, post,(err, results) => {
                  if (err) {console.log("Error2")}
                  else {

                    // Retrieving data from database from students02
        if(this.data.student02){
            let sql = `SELECT ID FROM students WHERE reg_no = "${this.data.student02}"`
            db.query(sql,(err, student_id) => {
                if (err) console.log("Error3")
    
                
                if (student_id.length == 0) callBackResponse.push(`Student ${this.data.student02} is not registered yet`)
                else {
                    let post = {
                        entry_id: uuidTemp,
                        student_id: student_id[0].ID,
                        room_id: room_id[0].room_id,
                        admin_id: 2,
                        issued_or_recieved: 'issued',
                    }
            
                    let sql = 'INSERT INTO roomhistory SET ?'
                    db.query(sql, post,(err, results) => {
                      if (err) {console.log(err)}
                      else {
    
                        // Retrieving data from database from students03
        if(this.data.student03){
            let sql = `SELECT ID FROM students WHERE reg_no = "${this.data.student03}"`
            db.query(sql,(err, student_id) => {
                if (err) console.log("Error5")
    
                
                if (student_id.length == 0) callBackResponse.push(`Student ${this.data.student03} is not registered yet`)
                else {
                    let post = {
                        entry_id: uuidTemp,
                        student_id: student_id[0].ID,
                        room_id: room_id[0].room_id,
                        admin_id: 2,
                        issued_or_recieved: 'issued',
                    }
            
                    let sql = 'INSERT INTO roomhistory SET ?'
                    db.query(sql, post,(err, results) => {
                      if (err) {console.log("Error6")}
                      else {
    
                        // Retrieving data from database from students04
        if(this.data.student04){
            let sql = `SELECT ID FROM students WHERE reg_no = "${this.data.student04}"`
            db.query(sql,(err, student_id) => {
                if (err) console.log("Error7")
    
                
                if (student_id.length == 0) callBackResponse.push(`Student ${this.data.student04} is not registered yet`)
                else {
                    let post = {
                        entry_id: uuidTemp,
                        student_id: student_id[0].ID,
                        room_id: room_id[0].room_id,
                        admin_id: 2,
                        issued_or_recieved: 'issued',
                    }
            
                    let sql = 'INSERT INTO roomhistory SET ?'
                    db.query(sql, post,(err, results) => {
                      if (err) {console.log("Error0")}
                      else {
    
                        callback("Sucess") 
                      }
                    })
                }
            })}
                      }
                    })
                }
            })}
                      }
                    })
                }
            })}
                    
                  }
                })
            }
        })}
        
    })


    

    
    
    
    // console.log(uuidTemp)

    // // Retrieving data from database from students
    // let sql = `SELECT ID FROM students WHERE room = "${data.student01}"`
    // db.query(sql,(err, results) => {
    //     if (err) console.log("Error")    

    // })

    // // Retrieving data from database
    // let sql = `INSERT INTO roomhistory (id, student_id, room_id, admin_id,issued_or_recieved) VALUES ('${uuidTemp}', '1111', '1111', '1111', 'issued')`;


    // db.query(sql,(err, results) => {
    //     if (err) console.log(err)

    //     // if (results.length) {
    //     //     if(results[0].password == this.data.password) {
    //     //         callback('success')
    //     //     } else callback('Wrong Username/Password.!')
            
    //     // } else callback('Wrong Username/Password.!')
    // })
}

Admin.prototype.updateReceivedDate = function(callback) {

    let sql = `UPDATE roomhistory 
    JOIN items
    ON items.room_id = roomhistory.room_id
    SET roomhistory.received_date = CURRENT_TIMESTAMP   
    WHERE items.item_id = "${this.data.sampleItemId}" AND roomhistory.entry_id = "${this.data.lastServedStudentUuid}"
    
    `
    db.query(sql,(err, results) => {
      if (err) {console.log(err)}
      callback("Success")
    //   console.log(results)
    })

}

Admin.prototype.getLastServedStudentUuidByItemId = function(callback) {

    let sql = `SELECT roomhistory.entry_id
    FROM roomhistory 
    JOIN rooms
    ON rooms.room_id = roomhistory.room_id
    JOIN items
    ON items.room_id = rooms.room_id
    WHERE items.item_id = "${this.data}"
    AND roomhistory.issued_or_recieved = "issued"
    ORDER BY roomhistory.id DESC
    LIMIT 1
    `
    db.query(sql,(err, results) => {
        if (err) console.log("Error")    
        else {
            if(results.length == 0) {
                callback ("")
            } else callback (results[0].entry_id)
            // console.log( results[0].entry_id)
            
        }
    })

}

Admin.prototype.getLastServedStudentUuid = function(callback) {

    let sql = `SELECT roomhistory.entry_id
    FROM hostel 
    JOIN rooms
    ON hostel.hostel_id = rooms.hostel_id
    JOIN roomhistory
    ON roomhistory.room_id = rooms.room_id
    JOIN students
    ON students.ID = roomhistory.student_id
    WHERE rooms.room_no = "${this.data.roomNumber}" AND hostel.name = "${this.data.hostelName}"
    AND roomhistory.issued_or_recieved = "issued"
    ORDER BY roomhistory.id DESC
    LIMIT 1
    `
    db.query(sql,(err, results) => {
        if (err) console.log("Error")    
        else {
            if(results.length == 0) {
                callback ("")
            } else callback (results[0].entry_id)
            // console.log( results[0].entry_id)
            
        }
    })
}
Admin.prototype.updateRooms_roomDetails_noStudent = function(callback) {

    let sql = `SELECT roomhistory.id, hostel.name, rooms.room_no, students.reg_no
    FROM hostel 
    JOIN rooms
    ON hostel.hostel_id = rooms.hostel_id
    JOIN roomhistory
    ON roomhistory.room_id = rooms.room_id
    JOIN students
    ON students.ID = roomhistory.student_id
    WHERE rooms.room_no = "${this.data.roomNumber}" AND hostel.name = "${this.data.hostelName}"
    AND roomhistory.issued_or_recieved = "issued"

    `
    db.query(sql,(err, results) => {
        if (err) console.log(err)    
        else callback (results)
    })
}

Admin.prototype.updateRooms_roomDetails = function(callback) {
    //Retrieving data from database from items table
    // Inner join


    
    // console.log(this.data.lastServedStudentUuid)

    let sql = `SELECT roomhistory.id, hostel.name, rooms.room_no, students.reg_no
    FROM hostel 
    JOIN rooms
    ON hostel.hostel_id = rooms.hostel_id
    JOIN roomhistory
    ON roomhistory.room_id = rooms.room_id
    JOIN students
    ON students.ID = roomhistory.student_id
    WHERE rooms.room_no = "${this.data.roomNumber}" AND hostel.name = "${this.data.hostelName}"
    AND roomhistory.issued_or_recieved = "issued" 
    AND roomhistory.entry_id = "${this.data.lastServedStudentUuid}"

    `
    db.query(sql,(err, results) => {
        if (err) console.log(err)    
        else callback (results)
    })

}

Admin.prototype.editButtonClick = function(callback) {
    let post = {
        conditionStatus: this.data.conditionStatus,
        note: this.data.note,
    }

    let sql = `UPDATE items SET ? WHERE items.item_id = "${this.data.item_id}"`
    db.query(sql, post,(err, results) => {
      if (err) {console.log(err)}
    //   console.log(results)
    })
}


Admin.prototype.checkStudentAvailability = function(callback) {

    let sql = `SELECT reg_no
    FROM students
    WHERE reg_no = "${this.data.student1}" OR reg_no = "${this.data.student3}" 
    OR reg_no = "${this.data.student2}" OR reg_no = "${this.data.student4}" 
    `

    db.query(sql,(err, results) => {
        if (err) {console.log(err)}
        else callback(results.length)
    })
}

Admin.prototype.checkStudentHasRoom = function(callback) {
    let sql = `SELECT students.reg_no
    FROM students 
    JOIN roomhistory
    ON roomhistory.student_id = students.ID
    WHERE roomhistory.issued_or_recieved = "issued" AND ( students.reg_no = "${this.data.student1}" OR students.reg_no = "${this.data.student3}" 
    OR students.reg_no = "${this.data.student2}" OR students.reg_no = "${this.data.student4}" )
    `

    db.query(sql,(err, results) => {
        if (err) {console.log(err)}
        else callback(results)
    })
}

module.exports = Admin
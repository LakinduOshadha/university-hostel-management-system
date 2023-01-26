const { CLIENT_IGNORE_SIGPIPE } = require("mysql/lib/protocol/constants/client")
const { colours } = require("nodemon/lib/config/defaults")
let Admin = require("../models/Admin")
const userController = require("./userController")

exports.serveRoomsPage = function (req, res) {
    res.render("SERVE-ROOMS")
}

exports.updateRoomsPage = function (req, res) {
    res.render("UPDATE-ROOM")
}

exports.withdrawRoomsPage = function (req, res) {
    res.render("WITHDRAW-ROOMS")
}

exports.roomDetailsPage = function (req, res) {
    res.render("ROOMS-DETAILS")
    
}

exports.postNoticePage = function (req, res) {
    res.render("Post-Notice")
}

exports.studentDetailsPage = function (req, res) {
    res.render("STUDENT-DETAILS")
}


exports.roomServeReportPage = function (req, res) {

    // console.log(req.body)
    let newBody = {hostelName:req.body.hostelName,roomNumber:req.body.roomNumber, student1:req.body.student1,student2:req.body.student2,student3:req.body.student3,student4:req.body.student4,
    isAllStudentsRegistered:false, isAlreadyInRoom: false}

    
    let totalStudents = 0
    if(!newBody.student2) {
        totalStudents = 1
    } else if (!newBody.student3){
        totalStudents = 2
    } else if (!newBody.student4){
        totalStudents = 3
    } else {
        totalStudents = 4
    }
    // Checking Student availability
    let admin = new Admin(req.body);
    admin.checkStudentAvailability (function(results) {
        if(results == totalStudents) {
            checkStudentHasRoom()
        } else {
            res.send("Please double check Registration Numbers")
        }

    })

    // Checking Student has room
    function checkStudentHasRoom() {
        admin.checkStudentHasRoom (function(results) {

            if(results.length == 0) {
                // getItemDetails()
                getLastServedStudentUuid()
            } else {
                let students = [];
                results.forEach(el => {
                    students.push(el.reg_no)
                })
                res.send(`These Students already have rooms => ${students.toString()}`)
            }
            

        })
    }

    


    // function getRoomDetails(){
    //     admin.updateRooms_roomDetails_noStudent (function(results) {
            
    //     })

    // }
    function getLastServedStudentUuid() {
        let newBody = {hostelName:req.body.hostelName,roomNumber:req.body.roomNumber,
            lastServedStudentUuid:""}

        admin.getLastServedStudentUuid(function(lastServedStudentUuid){
            // console.log(lastServedStudentUuid)
            newBody.lastServedStudentUuid = lastServedStudentUuid
            roomAndItemDetails(newBody)
    
        })
    }

    

    function roomAndItemDetails(newBody) {
        let admin = new Admin(newBody);
        if(newBody.lastServedStudentUuid) {
            admin.updateRooms_roomDetails (function(roomDetails) {
                // console.log(req.body)

                let tempStudent1 = {reg_no: req.body.student1}
                let tempStudent2 = {reg_no: req.body.student2}
                let tempStudent3 = {reg_no: req.body.student3}
                let tempStudent4 = {reg_no: req.body.student4}
                roomDetails.push(tempStudent1,tempStudent2,tempStudent3,tempStudent4)
                

            admin.itemDetails_serveRoom (function(tableData) {
        
                res.render("Room-Details---serve-rooms",
                {details: {roomDetails, hostelName: req.body.hostelName, 
                    roomNumber: req.body.roomNumber},
    
                tableData: tableData
                })
    
            })
            
            })
        } else {
            admin.updateRooms_roomDetails_noStudent (function(roomDetails) {
                
                let tempStudent1 = {reg_no: req.body.student1}
                let tempStudent2 = {reg_no: req.body.student2}
                let tempStudent3 = {reg_no: req.body.student3}
                let tempStudent4 = {reg_no: req.body.student4}
                roomDetails.push(tempStudent1,tempStudent2,tempStudent3,tempStudent4)
                
                admin.itemDetails_serveRoom (function(tableData) {
            
                    res.render("Room-Details---serve-rooms",
                    {details: {roomDetails, hostelName: req.body.hostelName, 
                        roomNumber: req.body.roomNumber},
        
                    tableData: tableData
                    })
        
                })
                
            })
        }
       

    }



    // function getItemDetails() {
    //     admin.itemDetails_serveRoom (function(results) {
    //         res.render("Room-Details---serve-rooms",
    //         {details: {student1: req.body.student1,student2: req.body.student2,
    //             student3:req.body.student3, student4: req.body.student4,
    //             hostelName: req.body.hostelName, roomNumber: req.body.roomNumber},
    //         tableData: results
    //         })
    //     })

    // }
    
}


exports.roomServeConfirm = function (req, res) {
    // console.log(req.body)

    let newBody = {hostelName:req.body.hostelName,roomNumber:req.body.roomNumber,
        lastServedStudentUuid:"", student01:req.body.student01 , 
        student02:req.body.student02 ,student03:req.body.student03 ,student04: req.body.student04}

    let admin = new Admin(req.body);
    admin.getLastServedStudentUuid(function(lastServedStudentUuid){
        // console.log(lastServedStudentUuid)
        newBody.lastServedStudentUuid = lastServedStudentUuid
        roomServeConfirm()

    })

    function roomServeConfirm() {
        let admin = new Admin(newBody)
        admin.roomServeConfirm (function(results) {
            // console.log(results)
            // res.render("SERVE-ROOMS")
    
            
            
        })
    }




    
    

}


exports.updateRooms = function (req, res) {

    let newBody = {hostelName:req.body.hostelName,roomNumber:req.body.roomNumber,
        lastServedStudentUuid:""}

    let admin = new Admin(req.body);
    admin.getLastServedStudentUuid(function(lastServedStudentUuid){
        // console.log(lastServedStudentUuid)
        newBody.lastServedStudentUuid = lastServedStudentUuid
        roomAndItemDetails(newBody)

    })

    function roomAndItemDetails(newBody) {
        let admin = new Admin(newBody);
        if(newBody.lastServedStudentUuid) {
            admin.updateRooms_roomDetails (function(roomDetails) {
            admin.itemDetails_serveRoom (function(tableData) {
        
                res.render("updateRoom",
                {details: {roomDetails, hostelName: req.body.hostelName, roomNumber: req.body.roomNumber},
    
                tableData: tableData
                })
    
            })
            
            })
        } else {
            admin.updateRooms_roomDetails_noStudent (function(roomDetails) {
                admin.itemDetails_serveRoom (function(tableData) {
            
                    res.render("updateRoom",
                    {details: {roomDetails, hostelName: req.body.hostelName, roomNumber: req.body.roomNumber},
        
                    tableData: tableData
                    })
        
                })
                
            })
        }
       

    }
    


}

exports.roomDetails = function (req, res) {
    let newBody = {hostelName:req.body.hostelName,roomNumber:req.body.roomNumber,
        lastServedStudentUuid:""}

    let admin = new Admin(req.body);
    admin.getLastServedStudentUuid(function(lastServedStudentUuid){
        // console.log(lastServedStudentUuid)
        newBody.lastServedStudentUuid = lastServedStudentUuid
        roomAndItemDetails(newBody)

    })

    function roomAndItemDetails(newBody) {
        let admin = new Admin(newBody);
        admin.updateRooms_roomDetails (function(roomDetails) {
            admin.itemDetails_serveRoom (function(tableData) {
        
                res.render("roomDetails",
                {details: {roomDetails, hostelName: req.body.hostelName, roomNumber: req.body.roomNumber},
    
                tableData: tableData
                })
    
            })
            
        })

    }

    // let admin = new Admin(req.body);
    // admin.updateRooms_roomDetails (function(roomDetails) {
    //     admin.roomDetails_serveRoom (function(tableData) {
        
    //         // newRoomDetails = [{name:"",room_no:"",reg_no:""},{name:"",room_no:"",reg_no:""},
    //         // {name:"",room_no:"",reg_no:""},{name:"",room_no:"",reg_no:""}]

    //         // i = 0
    //         // roomDetails.forEach(function(element) {
    //         //     newRoomDetails[i].name = element.name
    //         //     newRoomDetails[i].room_no = element.room_no
    //         //     newRoomDetails[i].reg_no = element.reg_no
    //         //     i++
    //         // });

            
    //         res.render("roomDetails",
    //         {details: {roomDetails,
    //             hostelName: req.body.hostelName, roomNumber: req.body.roomNumber},

    //         tableData: tableData
    //         })

    //     })
        
    // })
}

exports.editButtonClick = function (req, res) {

    // console.log(req.body)
    let admin = new Admin(req.body)
    admin.editButtonClick(function(results) {
        
    })


}

exports.printReport = function (req, res) {

    let sampleItemId = req.query.myArray[0]
    // console.log(req.query.myArray)
    req.query.myArray.splice(0,1);
    let totalCost = 0
    let tableData=[]
    // console.log(sampleItemId)

    if(!req.query.myArray.length) {
        updateReceivedDate()
       // tableData.push({name: "", cost:""})
    } else {
        // console.log(req.query.myArray)

    req.query.myArray.forEach((item_id) => {
        // console.log(item_id)
        let admin = new Admin(item_id);
        admin.getItemDetails (function(details) {
            totalCost = totalCost + details[0].cost
            tableData.push(details[0])
            if(item_id == req.query.myArray[req.query.myArray.length - 1]) { 
                updateReceivedDate()  
            }
            
        })
    })
    }



    function updateReceivedDate() {
        let admin = new Admin(sampleItemId);
        admin.getLastServedStudentUuidByItemId(function(lastServedStudentUuid) {
            let data ={sampleItemId: sampleItemId,lastServedStudentUuid: lastServedStudentUuid }
            let admin = new Admin(data);
            admin.updateReceivedDate (function(results) {
                if(results == "Success") {
                    tempFunc()
    
                }
            })

        })
        
    }
    

    function tempFunc() {
        // totalCost = totalCost - tableData[0].cost 
        // console.log(totalCost)
        // console.log(tableData)
        // tableData.splice(0, 1);
        // console.log(sampleItemId)
        
        let admin = new Admin(sampleItemId);
        admin.getRoomDetails (function(roomDetails) {
            // console.log(roomDetails)
            if(roomDetails.length == 0) {
                res.send("This room is not issued to any student")
            } else {
                let admin = new Admin(roomDetails[0].room_id)
                admin.updateRoomHistory_recieved (function(callback) {

                    // console.log(callback)
                    
                    
                })
                // console.log(roomDetails)
                res.render("Print-Report", {
                    details: {roomDetails, hostelName: roomDetails[0].name, roomNumber: roomDetails[0].room_no},
                    tableData : tableData,
                    totalCost
                })

                // let admin2 = new Admin(sampleItemId);

                // admin2.getRoomDetails (function(roomDetails) {
                //     console.log(roomDetails)
                //     res.render("Print-Report", {
                //         details: {roomDetails, hostelName: roomDetails[0].name, roomNumber: roomDetails[0].room_no},
                //         tableData : tableData,
                //         totalCost
                //     })
                // })
               
                
            }
            

        })

    }

    
}

exports.withdrawRoomDetails = function (req, res) {
    // res.render("Withdraw-rooms---details")
    // console.log(req.body)

    let newBody = {hostelName:req.body.hostelName,roomNumber:req.body.roomNumber,
        lastServedStudentUuid:""}

    let admin = new Admin(req.body);
    admin.getLastServedStudentUuid(function(lastServedStudentUuid){
        // console.log(lastServedStudentUuid)
        newBody.lastServedStudentUuid = lastServedStudentUuid
        roomAndItemDetails(newBody)

    })


    function roomAndItemDetails(newBody) {
        let admin = new Admin(newBody);
        admin.updateRooms_roomDetails (function(roomDetails) {
            admin.itemDetails_serveRoom (function(tableData) {
        
                if (tableData.length == 0) {
                    res.send("No items found in this room")
                } else {
                    // console.log(roomDetails)
                    res.render("Withdraw-rooms---details",
                {details: {roomDetails, hostelName: req.body.hostelName, roomNumber: req.body.roomNumber},
                tableData: tableData
                })
                }
                
    
            })
            
        })

    }

    // let admin = new Admin(req.body);
    // admin.updateRooms_roomDetails (function(roomDetails) {
    //     admin.roomDetails_serveRoom (function(tableData) {
    //         // console.log(tableData)
    
    //         res.render("Withdraw-rooms---details",
    //         {details: {roomDetails, hostelName: req.body.hostelName, roomNumber: req.body.roomNumber},

    //         tableData: tableData
    //         })

    //     })
        
    // })


}

exports.addStudentsButton = function (req, res) {
    // console.log(req.body)
    let newBody = {hostelName:req.body.hostelName, roomNumber:req.body.roomNumber,
        newStudent:req.body.newStudent,uuid:"", student_id:"", room_id:""}
    

    let admin = new Admin(req.body);
    admin.checkStudentHasRoomUpdate (function(results) {
        console.log(results)
        if(results.length == 0) {
            getUuid()
        } else {
            let students = [];
            results.forEach(el => {
                students.push(el.reg_no)
            })
            res.send(`These Students already have rooms => ${students.toString()}`)
        }
        

    })

    function getUuid() {
        
        admin.getLastServedStudentUuid (function(results) {
            // console.log(results)
            if(results.length == 0) {
                res.send("Please use serve rooms tab")
            } else {
                newBody.uuid = results
                getRoomDetails()

                
            }
        })
    }

    function getRoomDetails(){
        let admin = new Admin(newBody);
        admin.getRoomDetails (function(results) {
            // console.log(results)
            newBody.student_id = results[0].ID
            newBody.room_id = results[0].room_id

            let admin = new Admin(newBody)
            admin.addStudentsButton (function(results) {

                console.log(results)
            })

        })
    }


}

// exports.login = function (req, res) {
//     let admin = new Admin(req.body)
//     admin.login(function(results) {
//         if (results == 'success') {
//             res.render("admin")
//         } else {
//             res.send(results)
//         }
//     })
// }

// exports.login = function (req, res) {
//     let admin = new Admin(req.body)

//     console.log(userController)
//     admin.login(function(results) {
//         console.log(results)
//         if (results.loginStatus == 'success') {
//             res.render("admin")
//         } else {
//             res.send(results)
//         }
//     })



// }

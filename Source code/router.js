const express = require("express")
const router = express.Router()
const userController = require('./controllers/userController')
const adminController = require('./controllers/adminController')

router.get('/', userController.loginPage)
router.get('/login', userController.loginPage)
router.get('/sign-up', userController.signupPage)

router.post('/sign-up', userController.register)
router.post('/login', userController.login)

router.get('/logout', userController.logout)

router.get('/SERVE-ROOMS', adminController.serveRoomsPage)
router.get('/UPDATE-ROOM', adminController.updateRoomsPage)
router.get('/WITHDRAW-ROOMS', adminController.withdrawRoomsPage)
router.get('/ROOMS-DETAILS', adminController.roomDetailsPage)
router.get('/Post-Notice', adminController.postNoticePage)
router.get('/STUDENT-DETAILS', adminController.studentDetailsPage)
router.post('/room-serve-report', adminController.roomServeReportPage)

router.post('/roomServeConfirm', adminController.roomServeConfirm)
router.post('/room-update-page', adminController.updateRooms)
router.post('/roomDetails', adminController.roomDetails)
router.post('/withdrawRoomDetails', adminController.withdrawRoomDetails)

router.get('/Print-Report', adminController.printReport)
router.post('/addStudentsButton', adminController.addStudentsButton)



router.post("/editButtonClick", adminController.editButtonClick )


module.exports = router
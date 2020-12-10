const multer = require('multer');

const storage = multer.diskStorage({
	destination: (req, file, cb) => {
		cb(null, './src/public/uploads/')
	},
	filename: (req, file, cb) => {
		cb(null, `${new Date().toISOString()}-${file.originalname}`);
	}
});

const fileFilter = (req, file, cb) => {
	if (file.mimetype === 'image/jpeg' || file.mimetype === 'image/png') {
		cb(null, true);
	} else {
		cb(new Error('file is not jpeg/png'), false);
	}
}

const upload = multer({ storage, fileFilter })

module.exports = upload;
// const express = require('express');
// const mysql = require('mysql2');
// require('dotenv').config();
// const bodyParser = require('body-parser');
// const app = express();

// app.use(bodyParser.urlencoded({ extended: false }));
// app.set('view engine', 'ejs');

// // Serve static files (like CSS) from the "public" folder
// app.use(express.static('public'));

// // MySQL Connection
// const db = mysql.createConnection({
//     host: process.env.DB_HOST,
//     user: process.env.DB_USER,
//     password: process.env.DB_PASSWORD,
//     database: process.env.DB_DATABASE
// });

// db.connect((err) => {
//     if (err) throw err;
//     console.log('Connected to MySQL Database.');
// });

// // Routes
// app.get('/', (req, res) => {
//     res.render('index' , { dialogflowAgentId: process.env.DIALOGFLOW_AGENT_ID });
// });

// app.post('/track', (req, res) => {
//     const trackingNumber = req.body.tracking_number;
//     const query = 'SELECT * FROM shipments WHERE tracking_number = ?';
//     db.query(query, [trackingNumber], (err, results) => {
//         if (err) throw err;
//         res.render('result', { shipment: results[0] });
//     });
// });

// app.listen(process.env.PORT, () => {
//     console.log(`Server started on http://localhost:${process.env.PORT}`);
// });






const express = require('express');
const mysql = require('mysql2');
require('dotenv').config(); // For loading environment variables
const bodyParser = require('body-parser');
const app = express();

app.use(bodyParser.urlencoded({ extended: false }));
app.set('view engine', 'ejs');

// Serve static files (like CSS) from the "public" folder
app.use(express.static('public'));

// MySQL Connection
const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE
});

db.connect((err) => {
    if (err) throw err;
    console.log('Connected to MySQL Database.');
});

// Routes
// Home route
app.get('/', (req, res) => {
    res.render('index', { dialogflowAgentId: process.env.DIALOGFLOW_AGENT_ID });
});

// Route to track shipment details
app.get('/shipment/:trackingNumber', (req, res) => {
    const trackingNumber = req.params.trackingNumber;

    // Query the database to fetch shipment details based on the tracking number
    const query = 'SELECT * FROM shipments WHERE tracking_number = ?';
    db.query(query, [trackingNumber], (err, results) => {
        if (err) throw err;

        if (results.length > 0) {
            const shipment = results[0];  // Get the first matching result

            // Pass the shipment data and Mapbox access token to the template
            res.render('shipment-details', {
                shipment: shipment,
                mapboxAccessToken: process.env.MAPBOX_ACCESS_TOKEN
            });
        } else {
            // Handle case where no shipment is found
            res.render('shipment-details', {
                shipment: null,
                mapboxAccessToken: process.env.MAPBOX_ACCESS_TOKEN
            });
        }
    });
});

// Track shipment form (POST request)
app.post('/track', (req, res) => {
    const trackingNumber = req.body.tracking_number;
    const query = 'SELECT * FROM shipments WHERE tracking_number = ?';
    db.query(query, [trackingNumber], (err, results) => {
        if (err) throw err;
        res.render('result', { shipment: results[0] });
    });
});

// Start the server
app.listen(process.env.PORT, () => {
    console.log(`Server started on http://localhost:${process.env.PORT}`);
});

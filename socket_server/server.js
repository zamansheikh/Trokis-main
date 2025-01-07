const io = require('socket.io')(3000, { // Port 3000
    cors: {
        origin: '*', // Allow all origins (for development ONLY)
    },
});

require('dotenv').config();
const jwt = require('jsonwebtoken'); // Import JWT library
const SECRET_KEY = process.env.SECRET_KEY;
console.log('Your secret key:', SECRET_KEY);


// Generate a JWT token for testing
const token = jwt.sign({ userId: 123, username: 'testuser' }, SECRET_KEY, {
    expiresIn: '1h', // Token expires in 1 hour
});
console.log('Generated Token: Bearer', token);


// Middleware to Authenticate Token during Handshake
io.use((socket, next) => {
    console.log("Socket:", socket.handshake.headers.auth);
    // const token = socket.handshake.headers.auth.split(" ")[1];
    const token = socket.handshake.headers.auth.split(" ")[1]; // Get the token from client
    // console.log("Token:", socket.handshake.auth);
    // console.log
    if (!token) {
        return next(new Error('Authentication error: No token provied'));
    }

    jwt.verify(token, SECRET_KEY, (err, decoded) => {
        if (err) {
            return next(new Error('Authentication error: Invalid token'));
        }
        socket.user = decoded; // Attach user data to the socket
        next(); // Proceed to connection
    });



    socket.on("connect", () => {
        console.log("connected")
    })
});



// Event Listeners for Socket Connections
io.on('connection', (socket) => {
    console.log('A user connected: ', socket.id, 'User:', socket.user);

    // Handle Incoming 'chat message' Events
    socket.on('chat message', (msg) => {
        console.log('Message received from', socket.user, ': ', msg);
        io.emit('chat message', { user: socket.user, message: msg }); // Broadcast message with user data
    });

    // Handle Client Disconnections
    socket.on('disconnect', () => {
        console.log('User disconnected: ', socket.id);
    });
});

console.log("Server Started on Port:", 3000);
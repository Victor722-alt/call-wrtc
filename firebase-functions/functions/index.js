'use strict';

const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp();

exports.sendNotification = functions.https.onRequest(async (req, res) => {
    const { token, title, body } = req.body;

    const message = {
        notification: {
            title: title,
            body: body,
        },
        token: token,
    };

    try {
        const response = await admin.messaging().send(message);
        console.log('Notification sent successfully:', response);
        res.status(200).send({ success: true, response });
    } catch (error) {
        console.error('Error sending notification:', error);
        res.status(500).send({ success: false, error });
    }
});

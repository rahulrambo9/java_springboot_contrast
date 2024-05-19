document.getElementById('fetchMessage').addEventListener('click', function() {
    const messageDiv = document.getElementById('message');
    
    // Remove previous classes
    messageDiv.classList.remove('show');
    messageDiv.classList.remove('animate-fetch');

    fetch('/message')
        .then(response => response.text())
        .then(data => {
            messageDiv.innerText = data;

            // Apply animation class and show the message
            setTimeout(() => {
                messageDiv.classList.add('animate-fetch');
                messageDiv.classList.add('show');
            }, 300);
        })
        .catch(error => {
            console.error('Error fetching message:', error);
            messageDiv.innerText = 'Error fetching message';

            // Apply animation class and show the message
            setTimeout(() => {
                messageDiv.classList.add('animate-fetch');
                messageDiv.classList.add('show');
            }, 300);
        });
});

document.getElementById('changeColor').addEventListener('click', function() {
    document.body.classList.toggle('animate-color');
});

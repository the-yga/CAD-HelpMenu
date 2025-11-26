window.addEventListener('message', (event) => {
    const data = event.data;
    const videoFrame = document.getElementById('videoFrame');
    const videoContainer = document.querySelector('.video-container');
    const iframe = document.getElementById('tutorialVideo');

    if (data.action === 'showVideo') {
        iframe.src = data.video;
        videoFrame.style.opacity = '1';
        videoFrame.classList.remove('hidden');
        videoContainer.style.opacity = '1';
        videoContainer.style.transform = 'scale(1)';
    } else if (data.action === 'hideVideo') {
        videoContainer.style.opacity = '0';
        videoContainer.style.transform = 'scale(0.9)';
        videoFrame.style.opacity = '0';
        setTimeout(() => {
            iframe.src = '';
            videoFrame.classList.add('hidden');
        }, 500); 
    }
});

document.getElementById('closeBtn').addEventListener('click', () => {
    fetch(`https://${GetParentResourceName()}/closeVideo`, { method: 'POST' });
});

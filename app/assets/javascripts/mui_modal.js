const showPartialAsModal = (html, dimensions) => {
    let modal = document.createElement('div');
    modal.style.width = dimensions.width;
    modal.style.height = dimensions.height;
    modal.style.margin = '60px auto';
    modal.style.padding = '20px 20px';
    modal.style.backgroundColor = '#222020';
    modal.style.opacity = 0.85;
    modal.innerHTML = html;

    mui.overlay('on', modal, {
        static: true
    });

    return modal;
}

const cancelModal = event => {
    event.preventDefault();
    mui.overlay('off');
}

const resizableModal = (modal, height) => {
    let originalModelHeight = modal.offsetHeight;
    document.addEventListener('iziToast-opening', (data) => {
        setTimeout(null, 500);
        modal.style.height = `${originalModelHeight + height}px`;
        modal.style.transition = '0.5s';
    });

    document.addEventListener('iziToast-closed', () => {
        modal.style.height = `${originalModelHeight}px`;
    });
}
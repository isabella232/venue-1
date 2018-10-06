// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require mui
//= require siema/dist/siema.min.js
//= require izitoast/dist/js/iziToast.min.js
//= require social-share-button
//= require choices.js/assets/scripts/dist/choices.js
//= require cable
//= require transform_menu
//= require_tree ./main



const initiateSlider = (selector) => {
    App.slider = new Siema({
        selector: selector,
        duration: 2,
        easing: 'ease-out',
        perPage: 1,
        startIndex: 0,
        draggable: true,
        multipleDrag: true,
        threshold: 20,
        loop: true,
        rtl: false,
        onInit: () => { },
        onChange: () => { },
    });

    const prev = document.querySelector('.prev');
    const next = document.querySelector('.next');
    prev.addEventListener('click', () => App.slider.prev());
    next.addEventListener('click', () => App.slider.next());
}

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


const showToast = (key, value, options) => {
    let position, target
    position = options.position || 'bottomLeft'
    target = options.target || ''
    iziToast.show({
        title: key,
        message: value,
        position: position,
        theme: 'dark',
        backgroundColor: '#222020',
        zindex: 9999,
        target: target
    })
}
// General method to display selector using choices.js
const showMultiSelect = (elementId, options) => {
    defaultOptions = {
        removeItemButton: true
    }

    mergedOptions = Object.assign(defaultOptions, options)
    var element = document.getElementById(elementId)
    if (element) {
        var multiSelect = new Choices(element, mergedOptions);
    }

}

// General method to display an image preview on the form 
const displayImagePreview = (event, uploadElement, dimension) => {
    var files = event.target.files;
    document.getElementById(`${uploadElement}-upload-message`).innerHTML = `${files.length} files added`

    var output = document.getElementById(`${uploadElement}-preview`);
    output.innerHTML = ''
    for (var i = 0; i < files.length; i++) {
        var file = files[i];
        if (!file.type.match('image'))
            continue;
        var picReader = new FileReader();
        picReader.addEventListener("load", function (event) {
            var picFile = event.target;
            var div = document.createElement("span");
            div.innerHTML = `<img style='width: auto; max-height: ${dimension}px;' src= '${picFile.result}' title='${picFile.name}'/>`;
            output.insertBefore(div, null);
        });
        picReader.readAsDataURL(file);
    }
}

const customUpload = (selector, uploadElement, dimension) => {
    var uploadButton = document.getElementById(uploadElement)
    if (uploadButton) {
        // Time for some good old fashined Spaghetti Code!
        var filesInput = document.getElementById(selector);
        uploadButton.addEventListener('click', () => {
            filesInput.click();
        })
        filesInput.addEventListener('change', function (event) {
            displayImagePreview(event, uploadElement, dimension)
        })
    }
}

document.addEventListener('turbolinks:load', () => {
    transformMenu()
    let slider = document.querySelector('.carousel');
    if (slider) {
        initiateSlider('.carousel')
    }
})

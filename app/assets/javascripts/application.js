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
//= require stripe_payment
//= require choices.js/assets/scripts/dist/choices.js
//= require_tree .



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
    let slider = document.querySelector('.carousel');
    if (slider) {
        initiateSlider('.carousel')
    }
    var header = document.querySelector('#header'),
        header__has_top_right_links = document.querySelector('#header .has-top-right-links');
    header__has_top_right_links.innerHTML = header__has_top_right_links.innerHTML + '<a href="#" class="menu-burger"><svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" xmlns:xlink="http://www.w3.org/1999/xlink" enable-background="new 0 0 24 24"><g><path d="M24,3c0-0.6-0.4-1-1-1H1C0.4,2,0,2.4,0,3v2c0,0.6,0.4,1,1,1h22c0.6,0,1-0.4,1-1V3z"/><path d="M24,11c0-0.6-0.4-1-1-1H1c-0.6,0-1,0.4-1,1v2c0,0.6,0.4,1,1,1h22c0.6,0,1-0.4,1-1V11z"/><path d="M24,19c0-0.6-0.4-1-1-1H1c-0.6,0-1,0.4-1,1v2c0,0.6,0.4,1,1,1h22c0.6,0,1-0.4,1-1V19z"/></g></svg></a>';
    header.innerHTML = header.innerHTML + '<div id="device-menu"><ul></ul></div>';
    var header__device_menu = document.querySelector('#header #device-menu ul'),
        device_menu_items = [];
    [].forEach.call(document.querySelectorAll('#header ul#main-nav > li'), function (el) { device_menu_items.push(el.cloneNode(true)); });
    [].forEach.call(document.querySelectorAll('#header ul#top-right-links > li'), function (el) { device_menu_items.push(el.cloneNode(true)); });
    [].forEach.call(document.querySelectorAll('#header ul#artist-nav > li:first-child'), function (el) { device_menu_items.push(el.cloneNode(true)); });
    [].forEach.call(document.querySelectorAll('#header ul.account-sub-menu > li'), function (el) { device_menu_items.push(el.cloneNode(true)); });
    [].forEach.call(device_menu_items, function (item) {
        header__device_menu.innerHTML = header__device_menu.innerHTML + item.outerHTML;
    });
    [].forEach.call(document.querySelectorAll('#header .menu-burger'), function (el) {
        el.addEventListener('click', function (event) {
            event.preventDefault();
            document.querySelector('body').classList.toggle('show-device-menu');
        });
    });
    [].forEach.call(document.querySelectorAll('#header #device-menu ul li a[data-toggle]'), function (el) {
        el.addEventListener('click', function () {
            document.querySelector('body').classList.remove('show-device-menu');
        });
    });


    [].forEach.call(document.querySelectorAll('ul.nav li.has-sub-menu > a'), function (el) {
        el.addEventListener('click', function () {
            for (let sibling of this.parentNode.children) {
                if (sibling !== this) {
                    if (window.getComputedStyle(sibling).display === 'block')
                        sibling.style.display = 'none';
                    else
                        sibling.style.display = 'block';
                }
            }
            for (let li of this.parentNode.parentNode.children) {
                if (li !== this.parentNode
                    && li.querySelector('ul.sub-menu') != null)
                    li.querySelector('ul.sub-menu').style.display = 'none';
            }
        });
    });;

})

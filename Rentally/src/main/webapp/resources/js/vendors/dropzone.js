// Initialize Dropzone programmatically
Dropzone.autoDiscover = false;

const imgDropzone = new Dropzone("#img-dropzone", {
    url: `<%= path %>/rentally/admin/product/add`,
    maxFilesize: 5,
    acceptedFiles: "image/*",
    addRemoveLinks: true,
    autoProcessQueue: false,
    dictDefaultMessage: "파일을 드래그하거나 클릭하여 선택하세요.",
    maxFiles: 1,
    dictMaxFilesExceeded: "하나의 파일만 업로드할 수 있습니다."
});

// Add event listeners
imgDropzone.on("addedfile", function (file) {
    console.log("File added: " + file.name);
});

imgDropzone.on("removedfile", function (file) {
    console.log("File removed: " + file.name);
});

imgDropzone.on("success", function (file, response) {
    console.log("File uploaded successfully:", response);
});

const detailDropzone = new Dropzone("#detail-dropzone", {
    url: `<%= path %>/rentally/admin/product/add`,
    maxFilesize: 5,
    acceptedFiles: "image/*",
    addRemoveLinks: true,
    autoProcessQueue: false,
    dictDefaultMessage: "파일을 드래그하거나 클릭하여 선택하세요.",
    maxFiles: 1,
    dictMaxFilesExceeded: "하나의 파일만 업로드할 수 있습니다."
});

// Add event listeners
detailDropzone.on("addedfile", function (file) {
    console.log("File added: " + file.name);
});

detailDropzone.on("removedfile", function (file) {
    console.log("File removed: " + file.name);
});

detailDropzone.on("success", function (file, response) {
    console.log("File uploaded successfully:", response);
});

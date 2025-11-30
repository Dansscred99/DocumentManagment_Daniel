/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
const uploadBox = document.getElementById('uploadBox');
const fileInput = document.getElementById('fileInput');
const preview = document.getElementById('preview');
const submitSection = document.getElementById('submitSection');

// --- Detectar arrastre ---
uploadBox.addEventListener('dragover', (e) => {
    e.preventDefault();
    uploadBox.classList.add('dragging');
});

uploadBox.addEventListener('dragleave', () => {
    uploadBox.classList.remove('dragging');
});

uploadBox.addEventListener('drop', (e) => {
    e.preventDefault();
    uploadBox.classList.remove('dragging');
    fileInput.files = e.dataTransfer.files;
    mostrarPreview();
});

// --- Mostrar vista previa ---
fileInput.addEventListener('change', mostrarPreview);

function mostrarPreview() {
    if (fileInput.files.length > 0) {
        const file = fileInput.files[0];
        preview.innerHTML = `
                <div class="file-preview">
                    <strong>Archivo seleccionado:</strong> ${file.name} (${(file.size / 1024 / 1024).toFixed(2)} MB)
                </div>
            `;
        submitSection.style.display = 'flex';
    }
}

function resetPreview() {
    preview.innerHTML = '';
    fileInput.value = '';
    submitSection.style.display = 'none';
}

document.getElementById("fileInput").addEventListener("change", function () {
    const submitSection = document.getElementById("submitSection");
    if (this.files.length > 0) {
        submitSection.style.display = "flex"; // mostrar botones
    } else {
        submitSection.style.display = "none"; // ocultar si no hay archivos
    }
});

function resetPreview() {
    document.getElementById("fileInput").value = "";
    document.getElementById("submitSection").style.display = "none";
}
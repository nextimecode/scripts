const sourceElement = document.querySelector('source[type="application/x-mpegURL"]');
if (sourceElement) {
  console.log(sourceElement.src);
} else {
  console.log("Elemento não encontrado.");
}

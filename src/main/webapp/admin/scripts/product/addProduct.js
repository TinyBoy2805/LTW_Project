import { postData, getData } from "../api/api.js";

const unitItemTemplate = document.getElementById("unit-item-template")
const unitInputsList = document.getElementById("unit-input-list");
const addUnitButton = document.getElementById("add-unit-btn");
const moveToListButton = document.getElementById("move-to-list")

let sizeOfUnitItems = 0;

const renderUnit = () => {
    const clone = unitItemTemplate.content.cloneNode(true);
    const unitItem = clone.querySelector(".unit-item")
    unitItem.addEventListener('mousemove', () => {
        if (sizeOfUnitItems > 1) {
            toggleClose(true)
        } else {
            toggleClose(false)
        }
    })
    unitItem.addEventListener('mouseleave', () => {
        toggleClose(false)
    })
    unitItem.querySelector(".unit-item__remove-btn").addEventListener('click', () => {
        unitItem.remove();
        sizeOfUnitItems = unitInputsList.children.length;
    })
    unitInputsList.appendChild(clone);
    sizeOfUnitItems = unitInputsList.children.length;

    const toggleClose = (state) => {
        unitItem.querySelector(".unit-item__remove-btn").style.display = state ? "block" : "none";
    }
}

addUnitButton.addEventListener("click", () => {
    renderUnit();
})

moveToListButton.addEventListener('click', () => {
    const $ = document.querySelector.bind(document)
    const $$ = document.querySelectorAll.bind(document)

    const productNameField = $('#product__name');
    const categoryOption = $("#category")
    const branchOption = $("#brand")
    const importDate = $("#product__receipt__day")
    const expiredDate = $("#product__expire__day")
    const descriptionArea = $("#product__description")
    const unitItems = $$(".product-units__list > *")


    const units = [];
    unitItems.forEach(unit => {
        const unitName = unit.querySelector(".unit-item__select")
        const unitQuantity = unit.querySelector("#unit-quantity")
        const unitImportPrice = unit.querySelector("#unit-import-price");
        units.push({
            name: unitName.value,
            quantity: unitQuantity.value,
            importPrice: unitImportPrice.value
        })
    })

    const productData = {
        name: productNameField.value,
        category: categoryOption.value,
        brand: branchOption.value,
        importDate: importDate.value,
        expiredDate: expiredDate.value,
        description: descriptionArea.value,
        units: units
    }

    postData("/LTW_Project_war_exploded/admin/products/new-products", productData)
        .then(data => console.log("oke!"))
})

renderUnit();

/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
// // const leftSidebar = document.querySelector('.left-sidebar');
// //         const rightSidebar = document.querySelector('.right-sidebar');
const leftNav = document.querySelector('.left-nav')

window.addEventListener('scroll', () => {
    // Kiểm tra vị trí cuộn
})

function actionHover() {
    let ProductList = document.querySelectorAll('.product-item')
    ProductList.forEach((product) => {
        product.addEventListener('mouseover', () => {
            product.querySelector('.button-products').classList.add('activeHover')
        })
        product.addEventListener('mouseout', () => {
            product.querySelector('.button-products').classList.remove('activeHover')
        })
    })
}
actionHover()

// const rightBtn = document.getElementById("right-arrow")
// const leftBtn = document.getElementById("left-arrow")
// const listImage = document.querySelectorAll(".list-image")[0]
// const mainImg = document.getElementById("main-image");
// rightBtn.addEventListener("click", () => {
//     listImage.scrollLeft += 140;
// })
// leftBtn.addEventListener("click", () => {
//     listImage.scrollLeft -= 140;
// })

// const imageItem = document.querySelectorAll('.image-item')
// imageItem.forEach((item, currentIndex) => {
//         item.addEventListener('mouseover', () => {
//             console.log(currentIndex);
//             let itemImage = item.getElementsByTagName('img')[0]

//             for (let i = 0; i < imageItem.length; i++) {
//                 if (imageItem[i].classList.contains('onmouse')) {
//                     if (currentIndex != i) {
//                         imageItem[i].classList.remove('onmouse')
//                         break;
//                     }
//                 }
//             }

//             item.classList.add('onmouse')
//             mainImg.src = itemImage.src
//         })
//     })
// increase, decrease number product order
// const addNumberBtn = document.getElementById('addNumberBtn')
// const minusNumberBtn = document.getElementById('minusNumberBtn')
// const numberValue = document.getElementById('numberValue')
// const numberAvailable = document.getElementById('number-available')
// //avoid more than available
// numberValue.addEventListener('change', () => {
//     if (parseInt(numberValue.value) > parseInt(numberAvailable.innerText)) {
//         numberValue.value = parseInt(numberAvailable.innerText);
//     }
// })
// minusNumberBtn.addEventListener('click', () => {
//     if ((parseInt(numberValue.value) - 1) > 0) {
//         numberValue.value = (parseInt(numberValue.value) - 1);
//     }
// })
// addNumberBtn.addEventListener('click', () => {
//     if ((parseInt(numberValue.value) + 1) <= parseInt(numberAvailable.innerText)) {
//         numberValue.value = (parseInt(numberValue.value) + 1);
//     }
// })

//size choose
const sizeItem = document.querySelectorAll('.size-item')
sizeItem.forEach((item, index) => {
    item.addEventListener('click', () => {
        for (let i = 0; i < sizeItem.length; i++) {
            if (sizeItem[i].classList.contains('choose') && i != index) {
                sizeItem[i].classList.remove('choose')
                break;
            }
        }
        item.querySelector('.checkSize').click()
        item.classList.add('choose')
    })
})
//color choose
const colorItem = document.querySelectorAll('.color-item')
colorItem.forEach((item, index) => {
    item.addEventListener('click', () => {
        for (let i = 0; i < colorItem.length; i++) {
            if (colorItem[i].classList.contains('choose') && i != index) {
                colorItem[i].classList.remove('choose')
                break;
            }
        }
        item.querySelector('.checkColor').click()
        item.classList.add('choose')
    })
})
//neu cu them 1 vong lap cho child thi trc khi push can storeClickFilter.length = 'index cua vong lap child';
const listFilterBrand = document.querySelectorAll('.filter-brand_head')
const listBrand = document.querySelectorAll('.list-filter_child li')
console.log(listBrand[0].parentElement.parentElement);
const storeClickFilter = JSON.parse(localStorage.getItem('listFilter')) || []
//index1
listFilterBrand.forEach((item, index1) => {
    item.addEventListener('click', () => {
        item.parentElement.classList.toggle('choose-display');
        let iconFilter = item.querySelector('.icon-filter')
        if (iconFilter.classList.contains('bx-plus')) {
            iconFilter.classList.replace('bx-plus', 'bx-minus')
        } else {
            iconFilter.classList.replace('bx-minus', 'bx-plus')
        }
        let listChild = item.parentElement.querySelectorAll('.list-filter_child li')
        listChild.forEach((childItem, index2) => {
            childItem.addEventListener('click', () => {
                childItem.classList.add('choose-child')
            })
        })
    })
})
listBrand.forEach((item, index) => {
    item.addEventListener('click', () => {
        localStorage.setItem('indexBrand', index)
    })
})

var indexChoose = parseInt(localStorage.getItem('indexBrand') || 0);
listBrand[indexChoose].parentElement.parentElement.classList.toggle('choose-display');
listBrand[indexChoose].parentElement.parentElement.querySelector('.icon-filter').classList.replace('bx-plus', 'bx-minus')
listBrand[indexChoose].classList.add('choose-child');



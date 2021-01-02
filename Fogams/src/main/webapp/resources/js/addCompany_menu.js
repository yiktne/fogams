$(document).ready(function(){
            $('.btnAdd').click(function(){
                $('.addInput').append(
                    `<div>
                    <input type='hidden' name="company_no"/><br/>
                    상품 이름 <input type='text' class="input_menu" name='company_product'/><br/>
                    상품 가격  <input type='text' class="input_menu" name="company_money"/>
                    </div>
                    <div class="btnRemove"><button class="btn">삭제</button></div>
                    `
                );
                $('.btnRemove').on('click',function(){
                    $(this).prev().remove(); //.prev() : 선택한 요소의 바로 이전 위치한 형제요소
                    $(this).next().remove(); //.next() : 선택한 요소의 바로 다음에 위치한 형제요소
                    $(this).remove(); //선택한 요소 지우기
                });
            });
        });
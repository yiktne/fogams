const function_filter = document.querySelector('#functionFilter'); //버튼
const content_dis = document.querySelectorAll('.company_list'); //각 컨텐츠들


function_filter.addEventListener('click', (e)=>{
    const filter = e.target.dataset.filter;
    //console.log(filter);
    if(filter == null){
        return;
    }

    const active = document.querySelector('.tabs.selected');
    active.classList.remove('selected');
    //이미 selected 되어있던 요소에서 selected를 없앰
    const target = e.target;
    console.log(target);
    target.classList.add('selected');
    //클릭된 노드의 클래스이름으로 selected 추가

    //content.classList.add('anim-out');
    content_dis.forEach((con)=>{
        con.classList.add('anim-out');
    })

    setTimeout(()=>{
        content_dis.forEach((con)=>{
            if(filter === con.dataset.type){
                con.classList.remove('invisible');
            }else{
                con.classList.add('invisible');
            }
            con.classList.remove('anim-out');
        });
        //content.classList.remove('anim-out');
    },300);
});

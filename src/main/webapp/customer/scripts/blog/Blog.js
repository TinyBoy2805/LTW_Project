import {getBlogByPage} from "./blog-get.js";


const blog_container = document.querySelector('.main__parent')
const moreBtn = document.querySelector('.more-btn')
let page = 1;
const blog_template = document.querySelector('#blog__template')

// Track total number of blogs already rendered
let totalBlogsRendered = document.querySelectorAll('.main__parent article').length;

console.log('Blog.js loaded')
console.log('moreBtn:', moreBtn)
console.log('blog_container:', blog_container)
console.log('blog_template:', blog_template)
console.log('Initial blogs count:', totalBlogsRendered)

if(!moreBtn)
{
    console.error('❌ Button .more-btn not found!')
}

if(moreBtn)
{
    moreBtn.addEventListener('click', async ()=>
    {
        console.log('✅ Button clicked!')
        page++;
        const blogs = await getBlogByPage(page)
        console.log('Blogs received:', blogs)
        let index = 0;
        for(const blog of blogs)
        {
            const blogClone = blog_template.content.cloneNode(true)
            const article = blogClone.querySelector('article')

            article.className = `main__parent-article${((index++) % 6) + 1}`;
            article.querySelector('h3').textContent = `${blog.title}`
            article.querySelector('p').textContent = `${blog.content}`
            article.style.background = `url('${blog.thumbnail}')`
            article.querySelector('.read').href = `${blog.url}`
            blog_container.appendChild(blogClone)
        }
    })
}


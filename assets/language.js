function setLanguage(lang){
 document.documentElement.lang=lang;document.documentElement.dataset.language=lang;
 document.querySelectorAll('[data-set-language]').forEach(b=>b.setAttribute('aria-pressed',String(b.dataset.setLanguage===lang)));
 document.querySelectorAll('[data-language-link]').forEach(a=>{const u=new URL(a.href);u.searchParams.set('lang',lang);a.href=u.href});
 document.querySelectorAll('.localized-image').forEach(img=>{img.src=img.dataset[lang];img.alt=img.dataset[lang==='ja'?'altJa':'altEn']});
 const v=document.querySelector('video');if(v){const src=v.dataset[lang==='ja'?'videoJa':'videoEn'];if(v.getAttribute('src')!==src){v.pause();v.src=src;v.poster=v.dataset[lang==='ja'?'posterJa':'posterEn'];v.load()}}
 document.title=document.body.dataset.productName?document.body.dataset.productName+' | STUDiO405':document.body.dataset.product==='remaining'?(lang==='ja'?'Remaining — 目標まであとどれくらい？ | STUDiO405':'Remaining — How much is left? | STUDiO405'):(lang==='ja'?'STUDiO405 — 毎日にちょうどいいアプリ':'STUDiO405 — Apps for everyday life');
}
const query=new URLSearchParams(location.search).get('lang');
const preferred=(navigator.languages?.[0]||navigator.language||'en').toLowerCase();
setLanguage(['ja','en'].includes(query)?query:(preferred.startsWith('ja')?'ja':'en'));
document.querySelectorAll('[data-set-language]').forEach(b=>b.addEventListener('click',()=>setLanguage(b.dataset.setLanguage)));

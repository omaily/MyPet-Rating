import axios from 'axios';
import Link from 'next/link';
import styles from './Rating.module.css';
import ListItem from './manga/page';

type Manga = {
    id: string
    title: string
    title_en: string
    author: string
    rating: number
    start_d: string
    finish_d: string
    img: string
};

async function getList(): Promise<Manga[]> {
    const resurs = `http://localhost:4000/manga`
    const response = await axios.get<Manga[]>( resurs, 
        { headers: {Accept: 'application/json',},})
    // console.log(response.data)
    return response.data;
}

async function Sortir(){
    return (
        <aside className={styles.aside}>
        <div className={styles.subheadline}>
            Сортировка
        </div>
        <ul className={styles.block_list + " " + styles.orders + " " + styles.animeparams + " " + styles.subcontent}>
            <li data-field="order" data-value="ranked" className={styles.selected}>По рейтингу</li>
            <li className={styles.hidden} data-field="order" data-value="kind">По типу</li>
            <li data-field="order" data-value="popularity">По популярности</li>
            <li data-field="order" data-value="name">По алфавиту</li>
            <li data-field="order" data-value="aired_on">По дате выхода</li>
            <li data-field="order" data-value="ranked_random">Случайно</li>
            <li data-field="order" data-value="id_desc">По ID</li>
        </ul>
        </aside>
    );
}

export default async function Rating() {
    const mangas = await getList();
    return(
        <div className={styles.content}>

            <h1>Список манги</h1>
            <p>На данной странице отображена манга, отсортированная по рейтингу</p>

            <div className={styles.grid}>
                {mangas?.map((manga: Manga) => {
                return <ListItem key={manga.id} manga={manga}/> ;
                })}
            </div>
            
            {/* <Sortir/> */}

        </div>
        
    );
}
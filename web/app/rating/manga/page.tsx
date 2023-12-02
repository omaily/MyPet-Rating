import axios from 'axios';
import Link from 'next/link';
import styles from './Manga.module.css';


export default function ListItem({manga}:any) {
  return (
    <Link href={`/rating/manga/${manga.id}`}>
      <div className={styles.block}>
        <img  className={styles.image} src={manga.img}/>
        <div className={styles.description}>
          <div className={styles.title}>
            <p  >{manga.title}</p>
          </div>
          <div className={styles.metering}>
            <h1>{manga.rating}</h1>
          </div>
        </div>
      </div>
    </Link>
  );
}



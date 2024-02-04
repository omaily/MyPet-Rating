import axios from 'axios';
import styles from './Note.module.css'

async function getNote(noteId: string){
    // const response = await axios.get(
    //     `http://localhost:4000/manga/${noteId}`, 
    //     { headers: {
    //       Accept: 'application/json',
    //     },})
    // return await response.data.json();

    const response = {
        id: '1',
        name: 'John',
        age: 30,
        isAdmin: false,
        courses: ['html', 'css', 'js'],
        wife: null
    }

    return response
}

export default async function NotePage({params}:any) {
    const note = await getNote(params.id)
    return (
        <div>
            <h1>notes/{note.id}</h1>
            <div className={styles.note}>

            </div>
        </div>
    );
}
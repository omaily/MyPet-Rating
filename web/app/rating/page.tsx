"use client" 
import React, { useEffect, useState } from 'react';

import axios from 'axios';
import Link from 'next/link';
import styles from './Rating.module.css';
import FilterContent from './aside'
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

async function getList(): Promise<Manga[]>  {
    const resurs = `http://localhost:4000/manga`
    const res = await axios.get<Manga[]>(resurs,
        { headers: {Accept: 'application/json',},})
    console.log(res.data)
    return res.data;
}

export default function Rating() {

    // const [triage, setTriage] = useState("-");
    // const mangas = getList();


    const [data, setData] = useState<Manga[]>([]);
    useEffect(() => {
        const promise = getList();
        promise.then((resolvedData) => {
            const transformedData: Manga[] = resolvedData.map((item: any) => ({                
                id: item.id,
                title: item.title,
                title_en: item.title_en,
                author: item.author,
                rating: item.rating,
                start_d: item.start_d,
                finish_d: item.finish_d,
                img: item.img,
            }));
            setData(transformedData);
        });
    }, []);

    // const promise: Promise<Manga[]> = getList()
    // const transformedData: Manga[] = promise.then((resolvedData) => {
    //     return resolvedData
    // });

    return(
        <>
            {/* <h1>Test: {triage}</h1> */}
            <h1>Test:</h1>
            <h1 className='px-6'>Список манги</h1>
            <p className=' px-6'>На данной странице отображена манга, отсортированная по рейтингу</p>
            
            <div className='flex py-4'>
                <div className={'grow px-6 ' + styles.grid}>
                    {data?.map((manga: Manga) => ( 
                         <ListItem key={manga.id} manga={manga}/> 
                    ))}
                </div>

                <FilterContent />
            </div>

        </>
        
    );
}
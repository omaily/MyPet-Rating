"use client" 
import React, { useEffect, useState } from 'react';

import axios from 'axios';
import styles from './Rating.module.css';
import RadioGroup from './optional/aside'
import ListItem from './manga/page';

import orderby from "./optional/orderby.json";


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

async function getList(filtr: string): Promise<Manga[]>  {
    const resurs = `http://localhost:4000/manga`
    const res = await axios.get<Manga[]>(resurs,
        { headers: {Accept: 'application/json',},})
    return res.data;
}

export default function Rating() {
    const [data, setData] = useState<Manga[]>([]);
    
    const [triage, setTriage] = useState("rating");
    const handlePeriodChange = React.useCallback((val: string) => {
        console.log("handle change")
        setTriage(val);
    }, []);

    useEffect(() => {
        const promise = getList(triage);
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
    }, [triage] );

    function Aside(): React.ReactElement{

        return (
            <aside className='flex-none'>
                <RadioGroup 
                    selected={triage}
                    name="filter"
                    onChange={handlePeriodChange}
                    options={orderby}
                />
            </aside>
          );
    }

    return(
        <>
            <h1>Test:{triage}</h1>
            <h1 className='px-6'>Список манги</h1>
            <p className=' px-6'>На данной странице отображена манга, отсортированная по рейтингу</p>
            
            <div className='flex'>
                <div className={'grow px-6 py-4 ' + styles.grid}>
                    {data?.map((manga: Manga) => ( 
                         <ListItem key={manga.id} manga={manga}/> 
                    ))}
                </div>

                <Aside />

            </div>
        </>
        
    );
}




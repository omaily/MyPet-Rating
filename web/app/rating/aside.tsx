'use client'
import React, { useState } from 'react';
import styles from './Aside.module.css'

// export default function FilterContent(): React.ReactElement{

//     const [Item, setItem] = useState('По рейтингу');
//     const items = ['По рейтингу', 'По типу', 'По алфавиту', 'Дата выхода', 'Случайно', ' По Id'];

//     const Li = ({item}:{item: string}) => {
//         const handleItemClick = (item: string) => {
//             setItem(item);
//             // filterSorted()
//         };
//         return(
//             <li className={ Item === item ? styles.liPress: styles.li}
//                 onClick={() => handleItemClick(item)}
//             >
//                 {item}
//             </li>
//         )
//     }

//     return (
//         <aside className='flex-none '>
//             <div className={styles.block}>
//                 <div className={styles.group}>
//                     Сортировка
//                 </div>
//                 <div>
//                     {items.map((item, index) => (
//                         <Li key={index} item={item} />
//                     ))}
//                 </div>
//             </div>
//         </aside>
//       );
// }

export default function FilterContent(): React.ReactElement{
    return (
        <aside className='flex-none'>
            <RadioGroup/>
        </aside>
      );
}

function RadioGroup() {

    const [Item, setItem] = useState('По рейтингу');
    const items = ['По рейтингу', 'По типу', 'По алфавиту', 'Дата выхода', 'Случайно', ' По Id'];

    const Options = ({item}:{item: string}) => {
        const handleItemClick = (item: string) => {
            setItem(item);
            // filterSorted()
        };
        return(
            <li
                className={ Item === item ? styles.liPress: styles.li}
                onClick={() => handleItemClick(item)}
            >
                {item}
            </li>
        )
    }

    return (
        <div className={styles.radioGroup}>
            <div className={styles.groupName}>
                Сортировка
            </div>
            <div>
                {items.map((item, index) => (
                    <Options key={index} item={item} />
                ))}
            </div>
        </div>
    );
}
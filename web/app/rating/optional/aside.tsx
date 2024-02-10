'use client'
import React, { useEffect, useRef } from "react";
import styles from './RadioGroup.module.css'

type OptionType = {
    value: string;
    title: string;
};

type OptionProps = {
    value: OptionType["value"];
    title: OptionType["title"];
    selected: OptionType["value"];
    groupName: string;
    onChange?: (value: string) => void;
};

const Option = React.memo((props: OptionProps) => {

    const {value, title, selected, groupName, onChange} = props;
    // const {value, selected, onChange} = props;
    const optionRef = useRef<HTMLDivElement>(null);
    const handleChange = () => onChange?.(value);

    useEffect(() => {
        const option = optionRef.current;
        if (!option) return;

        const handleEnterKeyDown = (event: KeyboardEvent) => {
            if (document.activeElement === option && event.key === "Enter") {
                onChange?.(value);
            }
        };
        
        option.addEventListener("keydown", handleEnterKeyDown);
        return () => {
            option.removeEventListener("keydown", handleEnterKeyDown);
        };
    }, [value]);


    const inputId = `${groupName}_${value}`;
    const isChecked = value === selected;

    return (
        <div
          className={styles.item}
          key={value}
          data-checked={isChecked}
          data-testid={inputId}
          tabIndex={0}
          onClick={handleChange}
          ref={optionRef}
        >
            <input
              className={styles.input}
              type="radio"
              name={groupName}
              id={inputId}
              value={value}
              tabIndex={-1}
            />
            <label 
              className={styles.label} 
              htmlFor={inputId}
            >
                {title}
            </label>
        </div>
      );

});

type RadioGroupProps = {
    name: string;
    options: OptionType[];
    selected: OptionType["value"];
    onChange?: (value: string) => void;
};

function RadioGroup(props: RadioGroupProps) {

    const {name, options, selected, onChange} = props
    const handleChange = (value: string) => onChange?.(value);
    console.log("global render")
    
    return (
        <div className={"mt-4 " +styles.radioGroup}>
            <div className={styles.groupName}>
                Сортировка
            </div>
            <div className={"py-2"}>
                {options.map(({value, title}) => (
                    <Option
                        key={value}
                        groupName={name}
                        value={value}
                        title={title}
                        selected={selected}
                        onChange={handleChange}
                    />
                ))}
            </div>
        </div>
    );
}

export default React.memo(RadioGroup);
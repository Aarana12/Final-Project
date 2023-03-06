import ExitButton from "./ExitButton";
import { useState, useEffect } from "react";
import ResourceService from '../services/resource.service';
import FunctionDataService from '../services/function.service';

const body = {
    textAlign: 'center',
    float: "middle",
    width: '100%',
    margin: '40px auto'
}

const borderStyle = {
    borderWidth: '1px',
}

const tableStyle = {
    width: '100%',
    borderCollapse: 'collapse',
    float: "middle",
    marginBottom: '20px'
}

const topRow = {
    padding: '20px',
    backgroundColor: "#EEEEEE",
    border: "1px solid #EEEEEE",
    height: '50px',
}

const info = {
    float: 'right',
    fontFamily: "Times New Roman",
    fontWeight: "bold",
    fontSize: '40px',
    marginRight: '10px',
}

const trStyle = {
    border: "1px solid #EEEEEE",
    height: '50px',
} 

function ResourceReport(props) {

    const [resources, setResources] = useState([]);
    const [totalResources, setTotalResource] = useState(0);
    const [allFunctions, setAllFunctions] = useState([]);

    useEffect(() => {
        if(resources.length == 0) {
            getFunctions();
            findOwnersResources(); 
        }
    }, [resources]);

    var curr_user = localStorage.getItem("username"); 

    //Sets resources with all functions in DB
    function getFunctions() {
        return FunctionDataService.getAllFuncs()
            .then(response => {
                const rows = [];
                response.data.forEach(row => {
                    let rowObj = {
                        func_num: row.func_num,
                        func_name: row.func_name,
                    }
                    rows.push(rowObj);
                });
                setAllFunctions(rows);
            })
            .catch(e => {
                console.log(e);                
            });
    };

    //Querys DB for resources owned by user and sets resource
    const findOwnersResources = () => {
        return ResourceService.findOwnersResources(curr_user)
            .then(response => {
                let totalCount = 0;
                const ownerResources = [];
                response.data.forEach(row => {
                    let rowObj = {
                        func_num: row.prim_func_num,
                        count: row.count,
                    }
                    totalCount += row.count;
                    ownerResources.push(rowObj);
                })
                setTotalResource(totalCount);
                makeTable(ownerResources);
            })
            .catch(e => {
                console.log(e);
            });
    }

    //Sets count of resources owned by user
    const makeTable = (ownerResources) => {
        let resourceCounts = [];
        allFunctions.forEach(func => {
            let foundMatch = ownerResources.find((match) => {
                return match.func_num === func.func_num;
            })
            let counted = 0
            if(foundMatch) {
                counted = foundMatch.count;
            }
            let rowObj = {
                func_num: func.func_num,
                func_name: func.func_name,
                count: counted
            }         
            resourceCounts.push(rowObj);
        })
        setResources(resourceCounts);
    }

    return (
        <div style={body}>
            <h1 style={borderStyle}>Resource Report<span style={info}>i</span></h1>

            <table style={tableStyle}>
                <thead>
                    <tr style={topRow}>
                        <th>Primary Function #</th>
                        <th>Primary Function</th>
                        <th>Total Resources</th>
                    </tr>
                </thead>
                <tbody>
                    {resources.map(result => {
                        return [
                            <tr style={trStyle}>
                                <td>{result.func_num}</td>
                                <td>{result.func_name}</td>
                                <td>{result.count}</td>
                            </tr>
                        ]
                    })}
                    <tr style={topRow}>
                        <td></td>
                        <td>Total</td>
                        <td>{totalResources}</td>
                    </tr>
                </tbody>
            </table>

            <ExitButton setOnMainMenu={props.setOnMainMenu} onMainMenu={props.onMainMenu} />

        </div>


    );
}

export default ResourceReport;
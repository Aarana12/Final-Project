function MainMenu() 
{
    const buttonStyle = {
        backgroundColor: 'grey',
        color: 'white',
        float: 'right',
        fontSize: '30px',
    }

    const borderStyle = {
        borderBottomStyle: 'solid',
        borderWidth: '1px',
    }

    const menuStyle = {
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
    }

    const optionsStyle = {
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        fontWeight: 'normal',
    }
    
    return (
        <>
            <h1 style={borderStyle}>CIMT<span style={{float: 'right'}}>Name</span></h1>

            <h2 style={menuStyle}>Main Menu</h2>
            <h3 style={optionsStyle}>Add Available Resource</h3>
            <h3 style={optionsStyle}>Emergency Incident</h3>
            <h3 style={optionsStyle}>Search Resources</h3>
            <h3 style={optionsStyle}>Generate Resource Report</h3>

            <button style={buttonStyle}>Exit</button>

        </>
    );
}

export default MainMenu;
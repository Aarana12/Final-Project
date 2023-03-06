function Login() 
{
    // css style for submit button
    const buttonStyle = {
        backgroundColor: '#2986CC',
        color: 'white',
    }

    const formStyle = {
        textAlign: 'center'
    }

    const bannerStyle = {
        textAlign: 'center',
        borderStyle: 'solid',
        paddingTop: '20px',
        backgroundColor: '#EEEEEE',
    }

    //write function here to read user login and run query, call that function inline in the return

    return (
        <>
            <div style={bannerStyle}>
                <h1>Welcome to the CERT Incident Management Tool (CIMT)</h1>
                <p>The CIMT is an online web application that manages available resources and their assignments to various emergency incidents that may have already occured, are happening or may happen in the future in and around the Pasadena City College campus. Emergency incidents may include, but are not limited to, hazardous waste spills, acts of terrorism, nuclear incident, campus shooting, car crashes with fatalities, flooding, fire, etc.</p>
            </div>
            
            <form style={formStyle} id="login">
                <label><h1>Login</h1></label>

                <label>Username</label><br></br>
                
                <input></input><br></br>
                
                <label>Password</label><br></br>
                
                <input type='password'></input><br></br>
                
                <button type="submit" style={buttonStyle}>Submit</button>
            </form>
        </>
    );
}

export default Login;
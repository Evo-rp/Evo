import React from 'react';
import { useSelector } from 'react-redux';
import { Paper, Slide } from '@material-ui/core';
import { makeStyles } from '@material-ui/styles';
import { withRouter } from 'react-router-dom';
import { ToastContainer, Flip } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';

import { Admin, Developer, Staff } from '../Groups';

const useStyles = makeStyles((theme) => ({
	wrapper: {
		height: '100%',
		width: '100%',
		border: `10px solid #000`,
		transition: 'opacity 500ms',
	},
	inner: {
		position: 'relative',
		height: '100%',
	},
}));

export default withRouter(() => {
	const classes = useStyles();
	const hidden = useSelector((state) => state.app.hidden);
	const permissionName = useSelector(state => state.app.permissionName);
	const opacityMode = useSelector(state => state.app.opacity);

	const getPanel = () => {
		switch (permissionName) {
			case "Owner":
			case "Developer":
				return <Developer />;
			case "Admin":
				return <Admin />;
			case "Staff":
			default:
				return <Staff />;
		};
	};

	return (
		<Slide direction="up" in={!hidden}>
			<Paper 
				elevation={20}
				className={classes.wrapper} 
				style={{ opacity: opacityMode ? '60%' : null }}>
				<div className={classes.inner}>
					<ToastContainer
						position="bottom-right"
						newestOnTop={false}
						closeOnClick
						rtl={false}
						draggable
						transition={Flip}
						pauseOnHover={false}
					/>
					{getPanel(permissionName)}
				</div>
			</Paper>
		</Slide>
	);
});

import React from 'react';
import { makeStyles } from '@mui/styles';

const useStyles = makeStyles((theme) => ({
	wrapper: {
		padding: '20px 10px 20px 20px',
		height: '100%',
	},
}));

export default () => {
	const classes = useStyles();

	return (
		<div className={classes.wrapper}>
			<iframe src={'https://docs.google.com/document/d/1ai28Ct2v7e0VLLMzX59TcKbCvvul-M5YAj2C3U8aBug/edit?usp=sharing'} title="evo-sops" width="100%" height="100%"></iframe>
		</div>
	);
};

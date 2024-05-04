import React, { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { TextField, AppBar, IconButton, Grid, Pagination, Tooltip, ImageList, ImageListItem, ImageListItemBar } from '@material-ui/core';
import { makeStyles } from '@material-ui/styles';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { FileCopy, Delete } from '@material-ui/icons';
import Nui from '../../util/Nui';

const useStyles = makeStyles((theme) => ({
    wrapper: {
        height: '100%',
        background: theme.palette.secondary.main,
    },
    inner: {
        position: 'relative',
        height: '100%',
    },
    imagesContainer: {
        height: '89%',
        overflow: 'auto',
        '&::-webkit-scrollbar': {
            width: 6,
        },
        '&::-webkit-scrollbar-thumb': {
            background: '#ffffff52',
        },
        '&::-webkit-scrollbar-thumb:hover': {
            background: '#1de9b6',
        },
        '&::-webkit-scrollbar-track': {
            background: 'transparent',
        },
    },
    header: {
        background: '#00aced',
        fontSize: 20,
        padding: 15,
        lineHeight: '45px',
        height: 78,
    },
}));

export default (props) => {
    const classes = useStyles();
	const images = useSelector((state) => state.data.data.images);

    const copyUrl = (url) => {
        const el = document.createElement('textarea');
        el.value = url;
        document.body.appendChild(el);
        el.select();
        document.execCommand('copy');
        document.body.removeChild(el);
    }

    const deleteImg = (id) => {
        Nui.send('deleteImage', {
            id: id
        })
    }

    const takePicture = () => {
        Nui.send('takePicture')
    }

    return (
        <div className={classes.wrapper}>
            <div className={classes.inner}>
                <AppBar position="static" className={classes.header}>
                    <Grid container>
                        <Grid item xs={8} style={{ lineHeight: '50px' }}>
                            Gallery
                        </Grid>
                        <Grid item xs={4} style={{ textAlign: 'right' }}>
                            <Tooltip
                                title='Take Picture'
                            >
                                <IconButton
                                    className={classes.headerAction}
                                    onClick={() => takePicture()}
                                >
                                    <FontAwesomeIcon icon={['fas', 'plus']} />
                                </IconButton>
                            </Tooltip>
                        </Grid>
                    </Grid>
                </AppBar>

                <ImageList className={classes.imagesContainer} style={{ userSelect: 'none' }} cols={2} rowHeight={140}>
                    {images.map((item) => (
                        <ImageListItem key={item._id}>
                            <img src={item.image} />
                            <ImageListItemBar
                                actionIcon={
                                    <>
                                        <Tooltip
                                            title='Copy'
                                        >
                                            <IconButton>
                                                <FileCopy onClick={() => copyUrl(item.image)} style={{ color: 'white' }} />
                                            </IconButton>
                                        </Tooltip>

                                        <Tooltip
                                            title='Delete'
                                        >
                                            <IconButton>
                                                <Delete onDoubleClick={() => deleteImg(item._id)} style={{ color: 'red' }} />
                                            </IconButton>
                                        </Tooltip>
                                    </>
                                }
                            />
                        </ImageListItem>
                    ))}
                </ImageList>
            </div>
        </div>
    );
};

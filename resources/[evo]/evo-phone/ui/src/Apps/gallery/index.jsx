import React, { useEffect, useMemo, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import {  AppBar, IconButton, Grid, Tooltip, ImageList, ImageListItem, ImageListItemBar } from '@material-ui/core';
import { makeStyles } from '@material-ui/styles';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { FileCopy, Delete } from '@material-ui/icons';
import Nui from '../../util/Nui';
import { throttle } from 'lodash';

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
	const images = useSelector((state) => state.data.data.gallery);
    const dispatch = useDispatch()

    const fetch = useMemo(() => throttle(async () => {
        try {
            let res = await (await Nui.send('Phone:Gallery:GetImages')).json();
            if (res) {
                dispatch({
                    type: 'SET_DATA',
                    payload: {
                        type: 'gallery',
                        data: res,
                    },
                });
            } else {
                throw res;
            }
        } catch (err) {
            // console.log(err)
            // console.log('[ERROR] Error in Gallery app')
        }
    }, 5000), []);

    useEffect(() => {
        fetch();
    }, []);


    const copyUrl = (url) => {
        const el = document.createElement('textarea');
        el.value = url;
        document.body.appendChild(el);
        el.select();
        document.execCommand('copy');
        document.body.removeChild(el);
    }

    const deleteImg = (image) => {
        Nui.send('Phone:Gallery:DeleteImage', {
            image: image
        })
    }

    const takePicture = () => {
        Nui.send('Phone:Gallery:TakePhoto')
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

                {images.length > 0 &&
                    <ImageList className={classes.imagesContainer} style={{ userSelect: 'none' }} cols={2} rowHeight={140}>
                        {images.map((item, index) => (
                            <ImageListItem key={index}>
                                <img src={item.image} />
                                <ImageListItemBar
                                    actionIcon={
                                        <>
                                            <Tooltip
                                                title='Copy'
                                            >
                                                <IconButton
                                                    onClick={() => copyUrl(item.image)}
                                                >
                                                    <FileCopy style={{ color: 'white' }} />
                                                </IconButton>
                                            </Tooltip>

                                            <Tooltip
                                                title='Delete'
                                            >
                                                <IconButton
                                                    onClick={() => deleteImg(item.image)}
                                                >
                                                    <Delete style={{ color: 'red' }} />
                                                </IconButton>
                                            </Tooltip>
                                        </>
                                    }
                                />
                            </ImageListItem>
                        ))}
                    </ImageList>
                }

                {images.length <= 0 &&
                    <div
                        className={classes.imagesContainer}
                    >
                        <div
                            style={{
                                display: 'flex',
                                flexDirection: 'column',
                                justifyContent: 'center',
                                alignItems: 'center',
                                marginTop: '10vh'
                            }}
                        >
                            <FontAwesomeIcon
                                icon={['fa', 'image']}
                                style={{
                                    fontSize: '10vh',
                                    color: '#00aced'
                                }}
                            />

                            <span style={{ fontSize: '2vh', marginTop: '2vh' }}>No images found.</span>
                        </div>
                    </div>
                }
            </div>
        </div>
    );
};
